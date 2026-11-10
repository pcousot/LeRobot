"""Graphics -- emulation, sur tkinter, du module Graphics d'OCaml.

La version OCaml de LeRobot dessine avec la bibliotheque Graphics (X11,
donc XQuartz sur macOS). Ce module en fournit les fonctions utilisees par
LeRobot, avec la meme semantique :

  - origine en bas a gauche, ordonnees vers le haut ;
  - un point courant (moveto, lineto, current_point) ;
  - une couleur courante (set_color) et une epaisseur de trait
    (set_line_width) ;
  - lecture de la couleur d'un pixel (point_color), indispensable pour
    peindre.

Le dessin est fait dans une image en memoire (un bytearray RGB), recopiee
dans la fenetre (PhotoImage tkinter) par morceaux : seule la partie modifiee
depuis le dernier affichage est recopiee, au plus tous les 1/30 de seconde
pendant un dessin rapide, et toujours quand le programme attend (touche,
souris, pause). Le texte (draw_string) est un objet texte du canevas
tkinter, pose sur l'image ; il disparait quand un rectangle plein le
recouvre (comme le texte de la barre du bas quand on l'efface).

Les evenements clavier et souris sont mis en file par tkinter ; key_pressed,
read_key, button_down, mouse_pos et wait_next_event les consultent comme
Graphics.
"""

import os
import sys
import time

# ---------------------------------------------------------------------------
# Choix de l'interpreteur : le python3 de macOS (/usr/bin/python3) est lie a
# Tk 8.5, qui ne fonctionne plus sur les macOS recents (la fenetre ne s'ouvre
# pas et le programme reste bloque). On relance alors le programme avec un
# Python lie a Tk 8.6 ou plus (python.org, Homebrew avec python-tk...).

_CANDIDATS = [
    "/Library/Frameworks/Python.framework/Versions/Current/bin/python3",
    "/Library/Frameworks/Python.framework/Versions/3.14/bin/python3",
    "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3",
    "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3",
    "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3",
    "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3",
    "/opt/homebrew/bin/python3",
    "/usr/local/bin/python3",
]


def _tk_correct():
    try:
        import tkinter
        return tkinter.TkVersion >= 8.6
    except ImportError:
        return False


def _relancer():
    if os.environ.get("LEROBOT_RELANCE"):
        return
    import subprocess
    test = "import tkinter,sys; sys.exit(0 if tkinter.TkVersion >= 8.6 else 1)"
    for p in _CANDIDATS:
        if os.path.exists(p) and os.path.realpath(p) != os.path.realpath(sys.executable):
            try:
                ok = subprocess.run([p, "-c", test], stdout=subprocess.DEVNULL,
                                    stderr=subprocess.DEVNULL, timeout=20).returncode == 0
            except Exception:
                ok = False
            if ok:
                os.environ["LEROBOT_RELANCE"] = "1"
                # le repertoire de la bibliotheque doit rester accessible
                ici = os.path.dirname(os.path.abspath(__file__))
                chemin = os.environ.get("PYTHONPATH", "")
                if ici not in chemin.split(os.pathsep):
                    os.environ["PYTHONPATH"] = ici + (os.pathsep + chemin if chemin else "")
                sys.stdout.flush()
                os.execv(p, [p] + sys.argv)
    sys.stderr.write(
        "LeRobot : il faut un Python avec Tk 8.6 ou plus (le python3 de macOS\n"
        "a Tk 8.5, qui ne marche plus). Installer Python depuis python.org,\n"
        "ou avec Homebrew : brew install python-tk\n")
    sys.exit(1)


if not _tk_correct():
    _relancer()

import tkinter                      # noqa: E402
import tkinter.font                 # noqa: E402


class Graphic_failure(Exception):
    pass


# ---------------------------------------------------------------------------
# Couleurs : entiers 0xRRGGBB comme dans Graphics

def rgb(r, g, b):
    return (r << 16) | (g << 8) | b


black = 0x000000
white = 0xFFFFFF
red = 0xFF0000
green = 0x00FF00
blue = 0x0000FF
yellow = 0xFFFF00
cyan = 0x00FFFF
magenta = 0xFF00FF
background = white
foreground = black
transp = -1

# ---------------------------------------------------------------------------
# Etat

_root = None
_canvas = None
_photo = None
_W = 0
_H = 0
_buf = None                 # pixels RGB, ligne du haut d'abord
_dirty = None               # [x0, y0, x1, y1] (coordonnees tk, x1/y1 exclus)
_last_flush = 0.0
_color = black
_col3 = b"\x00\x00\x00"
_line_width = 1
_cx = 0
_cy = 0
_font = None
_textes = []                # (id, x0, y0, x1, y1) en coordonnees tk
_keys = []                  # touches en attente
_events = []                # evenements souris en attente
_mouse = (0, 0)
_button = False
_ferme = False
_titre = "LeRobot"
_on_close = None            # fonction appelee si l'on ferme la fenetre

INTERVALLE = 1.0 / 30

# Mode capture (verification automatique) : LEROBOT_CAPTURE=fichier.png.
# La fenetre reste cachee, les pauses sont supprimees, les touches viennent
# de LEROBOT_TOUCHES ; quand le programme attend une touche qui ne viendra
# pas, _sur_attente est appele (LibRobot : enregistrer le dessin et finir).
MODE_CAPTURE = bool(os.environ.get("LEROBOT_CAPTURE"))


def _attente_par_defaut():
    raise SystemExit(3)


_sur_attente = _attente_par_defaut


def attente_vide():
    """en mode capture, le programme attend une touche et il n'y en a plus"""
    if MODE_CAPTURE and not _keys:
        _sur_attente()


_ferme_par_utilisateur = False


def _verifier():
    if _ferme_par_utilisateur:
        raise SystemExit(0)
    if _root is None or _ferme:
        raise Graphic_failure("graphic screen not opened")


# ---------------------------------------------------------------------------
# Fenetre

def open_graph(spec=""):
    """spec : " LxH" comme Graphics (ex. " 800x700")."""
    global _root, _canvas, _photo, _W, _H, _buf, _font, _ferme, _dirty
    taille = spec.strip().split("x") if "x" in spec else ["600", "450"]
    _W, _H = int(taille[0]), int(taille[1])
    _root = tkinter.Tk()
    _root.title(_titre)
    _root.resizable(False, False)
    _canvas = tkinter.Canvas(_root, width=_W, height=_H, highlightthickness=0,
                             bd=0, background="white", cursor="crosshair")
    _canvas.pack()
    _photo = tkinter.PhotoImage(width=_W, height=_H)
    _canvas.create_image(0, 0, image=_photo, anchor="nw", tags=("fond",))
    _buf = bytearray(b"\xff" * (_W * _H * 3))
    _dirty = [0, 0, _W, _H]
    _font = tkinter.font.Font(family="Helvetica", size=13)
    _ferme = False
    _root.bind("<Key>", _sur_touche)
    _root.bind("<Motion>", _sur_mouvement)
    _root.bind("<ButtonPress-1>", _sur_bouton)
    _root.bind("<ButtonRelease-1>", _sur_relache)
    _root.protocol("WM_DELETE_WINDOW", _sur_fermeture)
    if MODE_CAPTURE:
        _root.withdraw()
        _keys.extend(os.environ.get("LEROBOT_TOUCHES", ""))
        return
    # fenetre au premier plan, avec le clavier
    _root.lift()
    _root.attributes("-topmost", True)
    _root.after(300, lambda: _root.attributes("-topmost", False))
    _root.update()
    _root.focus_force()
    _canvas.focus_set()
    synchronize()


def close_graph():
    global _ferme
    if _root is not None and not _ferme:
        _ferme = True
        try:
            _root.destroy()
        except tkinter.TclError:
            pass


def est_ouverte():
    return _root is not None and not _ferme


def set_window_title(t):
    global _titre
    _titre = t
    if est_ouverte():
        _root.title(t)


def size_x():
    _verifier()
    return _W


def size_y():
    _verifier()
    return _H


def _sur_fermeture():
    """Fermeture de la fenetre par l'utilisateur : fin du programme."""
    global _ferme_par_utilisateur
    _ferme_par_utilisateur = True
    close_graph()
    if _on_close is not None:
        try:
            _on_close()
        except Exception:
            pass


# ---------------------------------------------------------------------------
# Affichage

def synchronize():
    """Recopie dans la fenetre la partie modifiee de l'image et traite les
    evenements de tkinter."""
    global _dirty, _last_flush
    _verifier()
    if _dirty is not None:
        x0, y0, x1, y1 = _dirty
        x0 = max(0, x0); y0 = max(0, y0); x1 = min(_W, x1); y1 = min(_H, y1)
        _dirty = None
        if x0 < x1 and y0 < y1:
            w = x1 - x0
            lignes = []
            for y in range(y0, y1):
                i = (y * _W + x0) * 3
                lignes.append(_buf[i:i + 3 * w])
            data = b"P6 %d %d 255\n" % (w, y1 - y0) + b"".join(lignes)
            tmp = tkinter.PhotoImage(data=data, format="PPM")
            _photo.tk.call(_photo, "copy", tmp, "-to", x0, y0)
            del tmp
    try:
        _root.update()
    except tkinter.TclError:
        pass
    _last_flush = time.monotonic()
    _verifier()


def _peut_etre_afficher():
    if time.monotonic() - _last_flush > INTERVALLE:
        synchronize()


def _salir(x0, y0, x1, y1):
    """zone modifiee, en coordonnees tk, bornes incluses"""
    global _dirty
    if _dirty is None:
        _dirty = [x0, y0, x1 + 1, y1 + 1]
    else:
        d = _dirty
        if x0 < d[0]: d[0] = x0
        if y0 < d[1]: d[1] = y0
        if x1 + 1 > d[2]: d[2] = x1 + 1
        if y1 + 1 > d[3]: d[3] = y1 + 1


# ---------------------------------------------------------------------------
# Pixels (coordonnees Graphics : y vers le haut)

def _c3(c):
    return bytes(((c >> 16) & 255, (c >> 8) & 255, c & 255))


def _pixel(x, y):
    """allume le pixel (x, y) avec la couleur courante, sans marquer la zone"""
    if 0 <= x < _W and 0 <= y < _H:
        i = ((_H - 1 - y) * _W + x) * 3
        _buf[i:i + 3] = _col3


def _span(xa, xb, y, c3=None):
    """ligne horizontale de xa a xb (inclus) a l'ordonnee y"""
    if y < 0 or y >= _H:
        return
    if xa > xb:
        xa, xb = xb, xa
    xa = max(0, xa); xb = min(_W - 1, xb)
    if xa > xb:
        return
    row = _H - 1 - y
    i = (row * _W + xa) * 3
    _buf[i:i + 3 * (xb - xa + 1)] = (c3 or _col3) * (xb - xa + 1)
    _salir(xa, row, xb, row)


def point_color(x, y):
    _verifier()
    if 0 <= x < _W and 0 <= y < _H:
        i = ((_H - 1 - y) * _W + x) * 3
        b = _buf
        return (b[i] << 16) | (b[i + 1] << 8) | b[i + 2]
    return -1


def lire_pixel(x, y):
    """comme point_color, sans verification (pour peindre)"""
    i = ((_H - 1 - y) * _W + x) * 3
    b = _buf
    return (b[i] << 16) | (b[i + 1] << 8) | b[i + 2]


def plot(x, y):
    _verifier()
    _pixel(x, y)
    if 0 <= x < _W and 0 <= y < _H:
        _salir(x, _H - 1 - y, x, _H - 1 - y)
    _peut_etre_afficher()


def set_color(c):
    global _color, _col3
    _color = c
    _col3 = _c3(c)


def get_color():
    return _color


def set_line_width(n):
    global _line_width
    _line_width = max(0, int(n))


def moveto(x, y):
    global _cx, _cy
    _cx, _cy = int(x), int(y)


def rmoveto(dx, dy):
    moveto(_cx + dx, _cy + dy)


def current_point():
    return (_cx, _cy)


def current_x():
    return _cx


def current_y():
    return _cy


# --- traits ---------------------------------------------------------------

def _segment_fin(x0, y0, x1, y1):
    """segment d'un pixel d'epaisseur (Bresenham), extremites comprises"""
    if y0 == y1:
        _span(x0, x1, y0)
        return
    dx = abs(x1 - x0); dy = -abs(y1 - y0)
    sx = 1 if x0 < x1 else -1
    sy = 1 if y0 < y1 else -1
    err = dx + dy
    x, y = x0, y0
    while True:
        _pixel(x, y)
        if x == x1 and y == y1:
            break
        e2 = 2 * err
        if e2 >= dy:
            err += dy; x += sx
        if e2 <= dx:
            err += dx; y += sy
    _salir(min(x0, x1), _H - 1 - max(y0, y1), max(x0, x1), _H - 1 - min(y0, y1))


def _segment_epais(x0, y0, x1, y1, w):
    """trait epais a bouts droits (comme X11) : rectangle autour du segment"""
    if x0 == x1 and y0 == y1:
        d = w // 2
        _rect_plein(x0 - d, y0 - d, w, w)
        return
    import math
    lx, ly = x1 - x0, y1 - y0
    n = math.hypot(lx, ly)
    px, py = -ly / n * w / 2.0, lx / n * w / 2.0
    pts = [(x0 + px, y0 + py), (x1 + px, y1 + py), (x1 - px, y1 - py), (x0 - px, y0 - py)]
    _poly_plein([(round(a), round(b)) for a, b in pts], contour=False)


def _segment(x0, y0, x1, y1):
    if _line_width <= 1:
        _segment_fin(x0, y0, x1, y1)
    else:
        _segment_epais(x0, y0, x1, y1, _line_width)


def lineto(x, y):
    global _cx, _cy
    _verifier()
    x, y = int(x), int(y)
    _segment(_cx, _cy, x, y)
    _cx, _cy = x, y
    _peut_etre_afficher()


def rlineto(dx, dy):
    lineto(_cx + dx, _cy + dy)


def draw_segments(segs):
    for (a, b, c, d) in segs:
        moveto(a, b); lineto(c, d)


def draw_rect(x, y, w, h):
    m = current_point()
    moveto(x, y); lineto(x + w, y); lineto(x + w, y + h); lineto(x, y + h); lineto(x, y)
    moveto(*m)


# --- surfaces -------------------------------------------------------------

def _rect_plein(x, y, w, h):
    if w <= 0 or h <= 0:
        return
    for yy in range(y, y + h):
        _span(x, x + w - 1, yy)


def fill_rect(x, y, w, h):
    """comme Graphics sous X11 : le rectangle peint va de x a x + w et de
    y a y + h compris, soit (w + 1) x (h + 1) pixels"""
    _verifier()
    if w < 0 or h < 0:
        return
    _rect_plein(int(x), int(y), int(w) + 1, int(h) + 1)
    _effacer_textes(x, y, w, h)
    _peut_etre_afficher()


def _poly_plein(pts, contour=False):
    """remplit le polygone comme X11 (XFillPolygon, regle pair-impair) :
    un pixel est peint si son centre est dans le polygone. Dans les
    coordonnees de Graphics (y vers le haut), le centre du pixel (x, y)
    est le point (x + 0.5, y - 0.5)."""
    if not pts:
        return
    import math
    ys = [p[1] for p in pts]
    n = len(pts)
    for y in range(max(min(ys), 0), min(max(ys) + 1, _H - 1) + 1):
        yc = y - 0.5
        xs = []
        for i in range(n):
            xa, ya = pts[i]
            xb, yb = pts[(i + 1) % n]
            if ya == yb:
                continue
            if ya > yb:
                xa, ya, xb, yb = xb, yb, xa, ya
            if ya <= yc < yb:
                xs.append(xa + (yc - ya) * (xb - xa) / (yb - ya))
        xs.sort()
        for k in range(0, len(xs) - 1, 2):
            a = int(math.ceil(xs[k] - 0.5))
            b = int(math.ceil(xs[k + 1] - 0.5)) - 1
            if a <= b:
                _span(a, b, y)
    if contour:
        for i in range(n):
            _segment_fin(pts[i][0], pts[i][1], pts[(i + 1) % n][0], pts[(i + 1) % n][1])


def fill_poly(pts):
    _verifier()
    _poly_plein([(int(a), int(b)) for a, b in pts])
    _peut_etre_afficher()


def draw_poly(pts):
    _verifier()
    n = len(pts)
    for i in range(n):
        moveto(*pts[i]); lineto(*pts[(i + 1) % n])


def _points_arc(x, y, rx, ry, a1, a2):
    import math
    r = max(rx, ry, 1)
    pas = 0.5 / r
    t1, t2 = math.radians(a1), math.radians(a2)
    if t2 < t1:
        t1, t2 = t2, t1
    k = max(1, int((t2 - t1) / pas))
    pts = []
    for i in range(k + 1):
        t = t1 + (t2 - t1) * i / k
        p = (int(round(x + rx * math.cos(t))), int(round(y + ry * math.sin(t))))
        if not pts or pts[-1] != p:
            pts.append(p)
    return pts


def draw_arc(x, y, rx, ry, a1, a2):
    """arc de l'ellipse de centre (x, y) et de rayons rx, ry, de l'angle a1
    a l'angle a2 (degres, sens direct a partir de l'est)"""
    _verifier()
    pts = _points_arc(x, y, rx, ry, a1, a2)
    w = _line_width
    if w <= 1:
        for i in range(len(pts) - 1):
            _segment_fin(pts[i][0], pts[i][1], pts[i + 1][0], pts[i + 1][1])
        if len(pts) == 1:
            _pixel(*pts[0])
    else:
        # trait epais : un carre de cote w centre sur chaque point de l'arc
        lo = -(w // 2)
        for (a, b) in pts:
            _rect_plein(a + lo, b + lo, w, w)
    if pts:
        _salir(x - rx - w, _H - 1 - (y + ry + w), x + rx + w, _H - 1 - (y - ry - w))
    _peut_etre_afficher()


def draw_ellipse(x, y, rx, ry):
    draw_arc(x, y, rx, ry, 0, 360)


def draw_circle(x, y, r):
    draw_arc(x, y, r, r, 0, 360)


def fill_ellipse(x, y, rx, ry):
    _verifier()
    rx = max(rx, 0); ry = max(ry, 0)
    for dy in range(-ry, ry + 1):
        if ry == 0:
            dx = rx
        else:
            v = 1.0 - (dy / (ry + 0.5)) ** 2
            dx = int((rx + 0.5) * (v ** 0.5)) if v > 0 else 0
        _span(x - dx, x + dx, y + dy)
    _peut_etre_afficher()


def fill_circle(x, y, r):
    fill_ellipse(x, y, r, r)


def clear_graph():
    _verifier()
    global _cx, _cy
    _buf[:] = b"\xff" * (_W * _H * 3)
    _salir(0, 0, _W - 1, _H - 1)
    for t in _textes:
        _canvas.delete(t[0])
    del _textes[:]
    _cx, _cy = 0, 0
    _peut_etre_afficher()


# --- images ---------------------------------------------------------------
# une image est une matrice de couleurs (liste de lignes, la premiere en
# haut), transp pour les points transparents, comme make_image / dump_image

def make_image(m):
    return [list(l) for l in m]


def dump_image(img):
    return [list(l) for l in img]


def draw_image(img, x, y):
    _verifier()
    h = len(img)
    for i, ligne in enumerate(img):
        yy = y + h - 1 - i
        for j, c in enumerate(ligne):
            if c != transp and 0 <= x + j < _W and 0 <= yy < _H:
                k = ((_H - 1 - yy) * _W + x + j) * 3
                _buf[k:k + 3] = _c3(c)
    if h:
        _salir(x, _H - (y + h), x + len(img[0]) - 1, _H - 1 - y)
    _peut_etre_afficher()


def get_image(x, y, w, h):
    return [[point_color(x + j, y + h - 1 - i) for j in range(w)] for i in range(h)]


# --- texte ----------------------------------------------------------------

def _hex(c):
    return "#%06x" % (c & 0xFFFFFF)


def text_size(s):
    return (_font.measure(s), _font.metrics("linespace"))


def draw_string(s):
    """ecrit s, le coin en bas a gauche au point courant, qui avance"""
    global _cx
    _verifier()
    s = str(s)
    w, h = text_size(s)
    x, y = _cx, _H - _cy
    i = _canvas.create_text(x, y, text=s, anchor="sw", font=_font,
                            fill=_hex(_color), tags=("texte",))
    _canvas.tag_raise("robot")
    _textes.append((i, x, y - h, x + w, y))
    _cx += w
    _peut_etre_afficher()


def draw_char(c):
    draw_string(c)


def set_font(nom):
    pass


def set_text_size(n):
    pass


def _effacer_textes(x, y, w, h):
    """les textes entierement recouverts par le rectangle disparaissent"""
    if not _textes:
        return
    X0, X1 = x, x + w
    Y0, Y1 = _H - (y + h), _H - y
    garder = []
    for t in _textes:
        if t[1] >= X0 - 1 and t[3] <= X1 + 1 and t[2] >= Y0 - 2 and t[4] <= Y1 + 2:
            _canvas.delete(t[0])
        else:
            garder.append(t)
    _textes[:] = garder


# ---------------------------------------------------------------------------
# Objets poses sur le dessin (le robot) : ils ne font pas partie de l'image

def creer_icone(m):
    """PhotoImage transparente a partir d'une matrice de couleurs"""
    h = len(m); w = len(m[0]) if h else 0
    p = tkinter.PhotoImage(width=w, height=h)
    for i, ligne in enumerate(m):
        for j, c in enumerate(ligne):
            if c != transp:
                p.put(_hex(c), to=(j, i))
    return p


_objets = {}
_poses = {}                 # nom -> (icone, x, y) pour sauver_png


def poser(nom, icone, x, y):
    """pose l'icone (PhotoImage) avec son coin en bas a gauche en (x, y)"""
    _verifier()
    h = icone.height()
    X, Y = x, _H - (y + h)
    i = _objets.get(nom)
    if i is None:
        i = _canvas.create_image(X, Y, image=icone, anchor="nw", tags=("robot",))
        _objets[nom] = i
    else:
        _canvas.itemconfigure(i, image=icone, state="normal")
        _canvas.coords(i, X, Y)
    _canvas.tag_raise(i)
    _poses[nom] = (icone, X, Y)
    _peut_etre_afficher()


def poser_texte(nom, s, x, y, couleur=black):
    _verifier()
    i = _objets.get(nom)
    if i is None:
        i = _canvas.create_text(x, _H - y, text=s, anchor="sw", font=_font,
                                fill=_hex(couleur), tags=("robot",))
        _objets[nom] = i
    else:
        _canvas.itemconfigure(i, text=s, state="normal", fill=_hex(couleur))
        _canvas.coords(i, x, _H - y)
    _canvas.tag_raise(i)


def retirer(nom):
    i = _objets.get(nom)
    if i is not None and est_ouverte():
        _canvas.itemconfigure(i, state="hidden")
    _poses.pop(nom, None)


def sauver_png(fichier, avec_robot=True):
    """enregistre le dessin (sans les textes) dans un fichier PNG, avec le
    robot s'il est visible"""
    import zlib
    import struct
    img = bytearray(_buf)
    if avec_robot:
        for (icone, X, Y) in _poses.values():
            for j in range(icone.height()):
                for i in range(icone.width()):
                    x, y = X + i, Y + j
                    if 0 <= x < _W and 0 <= y < _H and not icone.transparency_get(i, j):
                        r, g, b = icone.get(i, j)
                        k = (y * _W + x) * 3
                        img[k:k + 3] = bytes((r, g, b))
    brut = b"".join(b"\0" + bytes(img[y * _W * 3:(y + 1) * _W * 3]) for y in range(_H))

    def bloc(t, d):
        c = struct.pack(">I", len(d)) + t + d
        return c + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    with open(fichier, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(bloc(b"IHDR", struct.pack(">IIBBBBB", _W, _H, 8, 2, 0, 0, 0)))
        f.write(bloc(b"IDAT", zlib.compress(brut, 6)))
        f.write(bloc(b"IEND", b""))


# ---------------------------------------------------------------------------
# Evenements

# fleches : codes des touches fleches du Macintosh (Graphics sous X11 ne
# les voyait pas)
FLECHE_GAUCHE = "\x1c"
FLECHE_DROITE = "\x1d"
FLECHE_HAUT = "\x1e"
FLECHE_BAS = "\x1f"
_FLECHES = {"Left": FLECHE_GAUCHE, "Right": FLECHE_DROITE,
            "Up": FLECHE_HAUT, "Down": FLECHE_BAS}


def _car(e):
    k = e.keysym
    if k in _FLECHES:
        return _FLECHES[k]
    if k in ("Return", "KP_Enter"):
        return "\r"
    if k == "BackSpace":
        return "\b"
    if k == "Delete":
        return "\x7f"
    if k == "Escape":
        return "\x1b"
    if k == "Tab":
        return "\t"
    return e.char if e.char else None


def _sur_touche(e):
    c = _car(e)
    if c:
        _keys.append(c)


def _xy(e):
    return (e.x, _H - 1 - e.y)


def _sur_mouvement(e):
    global _mouse
    _mouse = _xy(e)
    # les mouvements ne s'accumulent pas : seul le dernier compte
    if _events and _events[-1][0] == "motion":
        _events[-1] = ("motion", _mouse, _button)
    else:
        _events.append(("motion", _mouse, _button))


def _sur_bouton(e):
    global _mouse, _button
    _mouse = _xy(e)
    _button = True
    _events.append(("button", _mouse, True))


def _sur_relache(e):
    global _mouse, _button
    _mouse = _xy(e)
    _button = False
    _events.append(("release", _mouse, False))


def key_pressed():
    _verifier()
    _peut_etre_afficher()       # evenements traites au plus 30 fois par s.
    return bool(_keys)


def read_key():
    _verifier()
    synchronize()
    while not _keys:
        attente_vide()
        time.sleep(0.01)
        synchronize()
    return _keys.pop(0)


def button_down():
    _verifier()
    _peut_etre_afficher()
    return _button


def mouse_pos():
    _verifier()
    synchronize()
    return _mouse


class status:
    def __init__(self, mouse_x, mouse_y, button, keypressed, key):
        self.mouse_x = mouse_x
        self.mouse_y = mouse_y
        self.button = button
        self.keypressed = keypressed
        self.key = key


Button_down = "Button_down"
Button_up = "Button_up"
Key_pressed = "Key_pressed"
Mouse_motion = "Mouse_motion"
Poll = "Poll"


def wait_next_event(liste):
    """attend un evenement de la liste (Button_down, Button_up, Key_pressed,
    Mouse_motion, Poll) et rend l'etat (status)"""
    _verifier()
    while True:
        synchronize()
        if Key_pressed in liste and _keys:
            k = _keys.pop(0)
            # les mouvements en attente sont perimes
            return status(_mouse[0], _mouse[1], _button, True, k)
        while _events:
            sorte, (x, y), b = _events.pop(0)
            if (sorte == "motion" and Mouse_motion in liste) or \
               (sorte == "button" and Button_down in liste) or \
               (sorte == "release" and Button_up in liste):
                return status(x, y, b, False, "\0")
        if Poll in liste:
            return status(_mouse[0], _mouse[1], _button, bool(_keys),
                          _keys[0] if _keys else "\0")
        attente_vide()
        time.sleep(0.01)


def sound(freq, ms):
    pass
