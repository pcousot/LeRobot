# graphics_web.py -- the end of Graphics.py for the web version of LeRobot.
#
# The worker (worker.js) loads ../LeRobot_Python_EN/Graphics.py, removes its
# tkinter part (between the markers below) and appends this file: these
# definitions replace those of Graphics.py that use tkinter. Everything
# else (the picture in memory, lines, painting...) is Graphics.py itself.
# The page receives the picture (frame), the texts and the robot (overlay);
# keys, clicks and touches come back through the shared memory (lrjs.poll).

import json as _json
import lrjs as _js

_root = None
_texte_info = {}            # id -> (x, y, text, colour), tk coordinates
_nouveau = [0]
_icones = {}                # id -> (w, h)
_poses = {}                 # name -> (icon id, X, Y)
_textes_poses = {}          # name -> (x, y, text, colour)
_overlay = [True]


class _Icone:
    def __init__(self, i, w, h):
        self.id, self._w, self._h = i, w, h

    def width(self):
        return self._w

    def height(self):
        return self._h


def open_graph(spec=""):
    global _root, _W, _H, _buf, _dirty, _ferme
    taille = spec.strip().split("x") if "x" in spec else ["600", "450"]
    _W, _H = int(taille[0]), int(taille[1])
    _buf = bytearray(b"\xff" * (_W * _H * 3))
    _dirty = [0, 0, _W, _H]
    _ferme = False
    _root = True
    _texte_info.clear(); _poses.clear(); _textes_poses.clear()
    del _textes[:]
    _overlay[0] = True
    _js.open(_W, _H, _titre)
    synchronize()


def close_graph():
    global _ferme
    if _root is not None and not _ferme:
        try:
            synchronize()
        except Exception:
            pass
        _ferme = True
        _js.close()


def est_ouverte():
    return _root is not None and not _ferme


def set_window_title(t):
    global _titre
    _titre = t
    _js.title(t)


def _evenements():
    global _mouse, _button, _ferme_par_utilisateur
    for sorte, a, b, c in _js.poll().to_py():
        if sorte == 1:                      # key
            _keys.append(chr(a))
        elif sorte in (2, 3, 4):            # motion, press, release
            _mouse = (a, _H - 1 - b)
            if sorte == 2:
                if _events and _events[-1][0] == "motion":
                    _events[-1] = ("motion", _mouse, _button)
                else:
                    _events.append(("motion", _mouse, _button))
            elif sorte == 3:
                _button = True
                _events.append(("button", _mouse, True))
            else:
                _button = False
                _events.append(("release", _mouse, False))


def _envoyer_overlay():
    textes = [list(_texte_info[t[0]]) for t in _textes if t[0] in _texte_info]
    textes += [list(v) for v in _textes_poses.values()]
    robots = [[i, X, Y] for (i, X, Y) in _poses.values()]
    _js.overlay(_json.dumps({"texts": textes, "icons": robots}))
    _overlay[0] = False


def synchronize():
    global _dirty, _last_flush
    _verifier()
    if _dirty is not None:
        x0, y0, x1, y1 = _dirty
        x0 = max(0, x0); y0 = max(0, y0); x1 = min(_W, x1); y1 = min(_H, y1)
        _dirty = None
        if x0 < x1 and y0 < y1:
            w = x1 - x0
            lignes = [bytes(_buf[(y * _W + x0) * 3:(y * _W + x0) * 3 + 3 * w])
                      for y in range(y0, y1)]
            _js.frame(x0, y0, w, y1 - y0, b"".join(lignes))
    if _overlay[0]:
        _envoyer_overlay()
    _evenements()
    _last_flush = time.monotonic()
    _verifier()


def clear_graph():
    _verifier()
    global _cx, _cy
    _buf[:] = b"\xff" * (_W * _H * 3)
    _salir(0, 0, _W - 1, _H - 1)
    _texte_info.clear()
    del _textes[:]
    _overlay[0] = True
    _cx, _cy = 0, 0
    _peut_etre_afficher()


def text_size(s):
    return (int(_js.measure(str(s))), 16)


def draw_string(s):
    global _cx
    _verifier()
    s = str(s)
    w, h = text_size(s)
    x, y = _cx, _H - _cy
    _nouveau[0] += 1
    i = _nouveau[0]
    _texte_info[i] = (x, y, s, _hex(_color))
    _textes.append((i, x, y - h, x + w, y))
    _overlay[0] = True
    _cx += w
    _peut_etre_afficher()


def _effacer_textes(x, y, w, h):
    if not _textes:
        return
    X0, X1 = x, x + w
    Y0, Y1 = _H - (y + h), _H - y
    garder = []
    for t in _textes:
        if t[1] >= X0 - 1 and t[3] <= X1 + 1 and t[2] >= Y0 - 2 and t[4] <= Y1 + 2:
            _texte_info.pop(t[0], None)
            _overlay[0] = True
        else:
            garder.append(t)
    _textes[:] = garder


def creer_icone(m):
    h = len(m); w = len(m[0]) if h else 0
    _nouveau[0] += 1
    i = _nouveau[0]
    _js.icon(i, w, h, _json.dumps([c for ligne in m for c in ligne]))
    return _Icone(i, w, h)


def poser(nom, icone, x, y):
    _verifier()
    _poses[nom] = (icone.id, x, _H - (y + icone.height()))
    _overlay[0] = True
    _peut_etre_afficher()


def poser_texte(nom, s, x, y, couleur=black):
    _verifier()
    _textes_poses[nom] = (x, _H - y, s, _hex(couleur))
    _overlay[0] = True


def retirer(nom):
    if _poses.pop(nom, None) is not None or _textes_poses.pop(nom, None) is not None:
        _overlay[0] = True


def sauver_png(fichier, avec_robot=True):
    pass


def sound(freq, ms):
    pass
