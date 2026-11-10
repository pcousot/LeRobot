"""Principal -- les commandes du robot (traduction de Principal.ml).

Chaque commande modifie le robot (module Robot) puis le redessine : draw
(False) retire le robot du dessin, draw (True) le remet a sa nouvelle place.
Dans la version OCaml, le robot etait dessine dans l'image et le fond sous le
robot sauve puis remis ; ici le robot est une petite image posee sur le
dessin (Graphics.poser), qui n'en fait pas partie.
"""
import math
import time

import Graphics
from Graphics import (set_color, set_line_width, moveto, lineto, plot,
                      current_point, fill_rect, fill_poly, draw_arc,
                      draw_string, size_x, size_y, key_pressed, read_key,
                      button_down, wait_next_event, Key_pressed, text_size,
                      point_color, close_graph, black)
from Utile import Stop, deg_to_rad
import Grille
from Grille import valLgX, valLgY, valLgR, valLgT, g_lgX, g_lgY, g_lg
import Graph
from Graph import testbornes, init_pict, my_draw_bar, hBar, yTexteBar
import Robot
from Robot import (pixel, valBc, valEc, valX, valY, valOrientation, tb, tbvd,
                   tbvg, tse, tne, r_ce, r_tv, r_th, r_lc, r_bc, ec)
import Dessin
from Dessin import (current_color, show_ret, show_color, cc, echelleRobot,
                    gris, noir, blanc, bleu)
import Peinture


class STOP(Exception):
    """levee par vd et vg sur Echap (et non Stop : particularite conservee)"""
    pass


class Range_error(Exception):
    """le robot sortirait du cadre"""
    pass


# touches d'arret : Echap, paragraphe, diese
TOUCHES_ARRET = ("\x1b", "\xa7", "#")


def get_angle(n):
    """conversion orientation -> angle"""
    gt = valLgT()
    return [90., gt, 0., 360. - gt, 270., 180. + gt, 180., 180. - gt][n]

# ---------------------------------------------------------------------------
# Vitesse


v = 10                                  # vitesse de l'execution


def valVt():
    return v


def my_wait(n):
    """La version Caml Light temporisait par une boucle de calcul, devenue
    instantanee : on fait une vraie pause, de 0 (n=10) a 90 ms (n=1)."""
    if n < 10 and not Graphics.MODE_CAPTURE:
        Graphics.synchronize()
        time.sleep(0.01 * (10 - n))


def _rien():
    pass


# appele avant chaque commande du robot (LibRobot : joue les notes en
# attente avant de dessiner)
avant_action = _rien


def wait():
    avant_action()
    n = v
    if n > 0:
        my_wait(min(n, 10))
    else:
        c = read_key()
        if c in TOUCHES_ARRET:
            raise Stop()


def vt(n):
    global v
    v = min(max(n, 0), 10)


def pp():
    vt(0)


def ex():
    vt(10)


def increase_vt():
    vt(v + 1)


def decrease_vt():
    vt(v - 1)


def marquerUnePause():
    """fait clignoter la fleche de retour jusqu'a une touche ou un clic"""
    allume = True
    n = 0
    while True:
        show_ret(allume)
        if key_pressed() or button_down():
            return
        if Graphics.MODE_CAPTURE:
            return
        Graphics.synchronize()
        time.sleep(0.01)            # clignotement visible (~0,3 s)
        if n == 30:
            n = 0
            allume = not allume
        else:
            n += 1

# ===========================================================================
# Representation du robot


xinter = float(Graph.centrex)
yinter = float(Graph.centrey)
coord = False                     # afficher les coordonnees pres du robot


def draw_bar():
    my_draw_bar()
    show_ret(True)
    set_color(current_color())


def get_size_coord(a, b):
    chaine = "  (" + str(a) + "," + str(b) + ")"
    return (text_size(chaine), chaine)


def get_icon():
    if valBc():
        icones = [Dessin.robNt, Dessin.robNEt, Dessin.robEt, Dessin.robSEt,
                  Dessin.robSt, Dessin.robSOt, Dessin.robOt, Dessin.robNOt]
    else:
        icones = [Dessin.robN, Dessin.robNE, Dessin.robE, Dessin.robSE,
                  Dessin.robS, Dessin.robSO, Dessin.robO, Dessin.robNO]
    return icones[valOrientation()]


def correction(x, y):
    """coin du dessin du robot, pour que sa pointe soit sur la position"""
    (dx, dy) = [(-3, 0), (-2, -2), (0, -3), (-2, -4),
                (-3, -5), (-4, -4), (-5, -3), (-4, -2)][valOrientation()]
    return (x + dx * echelleRobot, y + dy * echelleRobot)


montrer_rob = True


def draw_robot():
    (x, y) = correction(pixel(valX()), pixel(valY()))
    Graphics.poser("robot", get_icon(), x, y)


def draw(test):
    """draw (True) montre le robot a sa place (s'il est dans le cadre),
    draw (False) le retire"""
    if not montrer_rob:
        return
    x = valX()
    y = valY()
    if test:
        if testbornes(pixel(x), pixel(y)):      # dans l'ecran : mise a jour
            draw_robot()
            if coord:
                (_, c) = get_size_coord(int((x - xinter) / valLgX()),
                                        int((y - yinter) / valLgY()))
                Graphics.poser_texte("coord", c, pixel(x), pixel(y),
                                     Graphics.get_color())
    else:
        Graphics.retirer("robot")
        Graphics.retirer("coord")

# ===========================================================================


def montrerRobot():
    global montrer_rob
    if not montrer_rob:
        montrer_rob = True
        draw(True)


def cacherRobot():
    global montrer_rob
    draw(False)
    montrer_rob = False
    draw(True)


def valVisible():
    return montrer_rob


def lc():
    draw(False)
    r_lc()
    draw(True)


def bc():
    r_bc()
    draw(False); draw(True)


def dp():
    draw(False)
    plot(pixel(valX()), pixel(valY()))
    draw(True)


def dc():
    x = pixel(valX())
    y = pixel(valY())
    draw(False)
    moveto(x + 2, y)
    lineto(x - 2, y)
    moveto(x, y + 2)
    lineto(x, y - 2)
    moveto(x, y)
    draw(True)

# ---------------------------------------------------------------------------
# Rotations


def _pivot(f):
    def commande():
        f()
        draw(False); draw(True)
    commande.__name__ = f.__name__[2:]
    commande.__qualname__ = commande.__name__
    return commande


# absolues
pn = _pivot(Robot.r_pn)                 # pivoter nord
pne = _pivot(Robot.r_pne)               # pivoter nord-est
pe = _pivot(Robot.r_pe)                 # pivoter est
pse = _pivot(Robot.r_pse)               # pivoter sud-est
ps = _pivot(Robot.r_ps)                 # pivoter sud
psw = _pivot(Robot.r_psw)               # pivoter sud-ouest
pw = _pivot(Robot.r_pw)                 # pivoter ouest
pnw = _pivot(Robot.r_pnw)               # pivoter nord-ouest


def pivoter(n):
    Robot.r_pivoter(n)
    draw(False); draw(True)


# relatives
phtd = _pivot(Robot.r_phtd)             # huitieme de tour a droite
phtg = _pivot(Robot.r_phtg)             # huitieme de tour a gauche
pqtd = _pivot(Robot.r_pqtd)             # quart de tour a droite
pqtg = _pivot(Robot.r_pqtg)             # quart de tour a gauche
p3htd = _pivot(Robot.r_p3htd)           # trois huitiemes a droite
p3htg = _pivot(Robot.r_p3htg)           # trois huitiemes a gauche
pdt = _pivot(Robot.r_pdt)               # demi-tour

# ---------------------------------------------------------------------------
# Longueurs de la grille


def lgX(l):
    l0 = max(0., float(l))
    draw(False)
    g_lgX(l0)
    draw(True)


def lgY(l):
    l0 = max(0., float(l))
    draw(False)
    g_lgY(l0)
    draw(True)


def lg(l):
    l0 = max(0., float(l))
    draw(False)
    g_lg(l0)
    draw(True)


def lgRT(r, theta=None):
    """lgRT (r, t) : carreau de diagonale r faisant l'angle t avec
    l'horizontale, pour tout angle t (lgX = |r cos t|, lgY = |r sin t|),
    comme sur le Macintosh : Pentagone_1 fait lgRT (L, 144) puis pqtg; av
    pour tracer le cote a 144 degres."""
    if theta is None:
        (r, theta) = r
    r0 = max(0., float(r))
    t = deg_to_rad(theta)
    draw(False)
    g_lgX(abs(r0 * math.cos(t)))
    g_lgY(abs(r0 * math.sin(t)))
    draw(True)

# ---------------------------------------------------------------------------
# Longueur du dernier trace


def valLgTl():
    return Robot.lgTl

# ---------------------------------------------------------------------------
# Sortie de la fenetre


sortie = False


def autoriserSorties():
    global sortie
    sortie = True


def interdireSorties():
    global sortie
    sortie = False


def valAutoriserSorties():
    return sortie

# ---------------------------------------------------------------------------
# Deplacements relatifs


def translater(dx, dy=None):
    """deplace le robot de (dx, dy) carreaux, sans tracer"""
    if dy is None:
        (dx, dy) = dx
    a = valX() + dx * valLgX()
    b = valY() + dy * valLgY()
    aint = pixel(a)
    bint = pixel(b)
    if testbornes(aint, bint):
        draw(False)
        Robot.r_translater(a, b)
        moveto(aint, bint)
        draw(True)
    elif sortie:
        draw(False)
        Robot.r_translater(a, b)
        moveto(aint, bint)
    else:
        raise Range_error("translater")


def trait(x2, y2):
    """Trait epais : le crayon du Macintosh (QuickDraw) est un carre, un
    trait epais est donc la trace d'un carre de cote valEc () deplace le long
    du segment (un rectangle pour un trait horizontal ou vertical), alors que
    X11 arrondit les bouts des traits epais. On remplit l'enveloppe convexe
    des deux carres aux extremites."""
    w = valEc()
    if w <= 1:
        lineto(x2, y2)
        return
    (x1, y1) = current_point()
    lo = -(w // 2)
    hi = (w - 1) // 2

    def coins(x, y):
        return [(x + lo, y + lo), (x + hi, y + lo), (x + hi, y + hi), (x + lo, y + hi)]

    pts = sorted(set(coins(x1, y1) + coins(x2, y2)))

    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    def demi(l):
        h = []
        for p in l:
            while len(h) >= 2 and cross(h[-2], h[-1], p) <= 0:
                h.pop()
            h.append(p)
        return h

    bas = demi(pts)
    haut = demi(list(reversed(pts)))
    enveloppe = bas[:-1] + haut[:-1]
    fill_poly(enveloppe)
    moveto(x2, y2)


def av_effect():
    if (not tb()) or valAutoriserSorties():
        draw(False)
        # reaffichage de la barre de commande durant une sortie
        if not testbornes(Robot.arrondi(valX()), Robot.arrondi(valY())):
            draw_bar()
        Robot.r_av_effect()
        if valBc():
            trait(pixel(valX()), pixel(valY()))
        else:
            moveto(pixel(valX()), pixel(valY()))
        if testbornes(Robot.arrondi(valX()), Robot.arrondi(valY())):
            draw(True)
    else:
        raise Range_error("av")


def _test_arret(exception):
    """touche frappee pendant le dessin : Echap arrete, les autres sont
    ignorees"""
    if key_pressed():
        c = read_key()
        if c in TOUCHES_ARRET:
            raise exception()


def av():
    """avancer d'un carreau"""
    _test_arret(Stop)
    av_effect()


def avf(n):
    """avancer de n carreaux (reculer si n < 0)"""
    if n >= 0:
        for k in range(n):
            av()
    else:
        pdt()
        for k in range(-n):
            av()
        pdt()

# ---------------------------------------------------------------------------
# Virages


def _arc(args):
    (a, b, c, d, e, f) = args
    draw_arc(a, b, c, d, e, f)


def vd_effect():
    """virage a droite"""
    if (not tbvd()) or valAutoriserSorties():
        if valBc():
            draw(False)
            if valOrientation() % 2 == 0:
                _arc(Robot.vd_cardinaux())
            elif tse():
                # deux appels en sequence : le second deplace le robot
                a1 = Robot.vd_non_cardinaux(1)
                a2 = Robot.vd_non_cardinaux(2)
                _arc(a1); _arc(a2)
            else:
                _arc(Robot.vd_non_cardinaux(0))
            moveto(pixel(valX()), pixel(valY()))
            if testbornes(Robot.arrondi(valX()), Robot.arrondi(valY())):
                draw(True)
        else:
            phtd()
            av()
            phtd()
    else:
        raise Range_error("vd")


def vd():
    _test_arret(STOP)
    vd_effect()


def vg_effect():
    """virage a gauche"""
    if (not tbvg()) or valAutoriserSorties():
        if valBc():
            draw(False)
            if valOrientation() % 2 == 0:
                _arc(Robot.vg_cardinaux())
            elif not tne():
                _arc(Robot.vg_non_cardinaux(0))
            else:
                # deux appels en sequence : le second deplace le robot
                a1 = Robot.vg_non_cardinaux(1)
                a2 = Robot.vg_non_cardinaux(2)
                _arc(a1); _arc(a2)
            moveto(pixel(valX()), pixel(valY()))
            if testbornes(Robot.arrondi(valX()), Robot.arrondi(valY())):
                draw(True)
        else:
            phtg()
            av()
            phtg()
    else:
        raise Range_error("vg")


def vg():
    _test_arret(STOP)
    vg_effect()

# ===========================================================================
# Affichage de la grille


def get_start_position(posx, posy):
    """premier point de la grille (en bas a gauche) passant par (posx, posy)"""
    pasx = valLgX()
    pasy = valLgY()
    return (posx - int(posx / pasx) * pasx, posy - int(posy / pasy) * pasy)


# un point de la grille : carre de cotePointGrille pixels de cote (un seul
# pixel, comme en 1998, est a peine visible sur un ecran Retina)
cotePointGrille = 2


def point_grille(x, y):
    d = (cotePointGrille - 1) // 2
    fill_rect(x - d, y - d, cotePointGrille, cotePointGrille)


def draw_net_line(x0, y0, color):
    """dessine les points de la grille, rangee par rangee ; Echap arrete"""
    pasx = valLgX()
    pas = valLgY()
    xs = []
    x = x0
    while pixel(x) <= size_x() - 1:
        xs.append(x)
        x += pasx
    y = y0
    while True:
        set_color(color)
        if key_pressed():
            c = read_key()
            if c in TOUCHES_ARRET:
                return
        if pixel(y) < size_y() - 1:
            py = pixel(y)
            for x in xs:
                point_grille(pixel(x), py)
            y += pas
        else:
            return


def dg():
    """dessine la grille"""
    a = valX()
    b = valY()
    (x0, y0) = get_start_position(a, b)
    draw(False)
    set_color(gris)
    set_line_width(1)
    if valLgX() > 0 and valLgY() > 0:
        draw_net_line(x0, y0, noir)             # couleur grille
    moveto(pixel(a), pixel(b))
    set_line_width(valEc())
    draw(True)

# ===========================================================================
# Deplacements absolus


def tracer(a, b=None):
    """amene le robot au pixel (a, b), en tracant si le crayon est baisse"""
    if b is None:
        (a, b) = a
    draw(False)
    if valBc():
        trait(a, b)
    else:
        moveto(a, b)
    r_ce(float(a), float(b))
    draw(True)


def tl(l):
    """translation de l points + changement de repere"""
    # longueur negative : on recule (demi-tour, tl de -l, demi-tour) ;
    # lgX, lgY et lgRT n'acceptent pas de longueur negative
    if l < 0.:
        pdt(); tl(-l); pdt()
        return
    # longueur nulle : le robot ne bouge pas et garde sa grille, donc sa
    # direction (FloconTernaire fait tl (L div 3) avec L = 2)
    if l < 1e-9:
        return
    vo = valOrientation()
    if vo % 2 == 0:                     # points cardinaux
        if vo % 4 == 0:                 # N ou S
            oldY = valLgY()
            lgY(l)
            # grille degeneree (longueur quasi nulle) : grille carree
            lgX(l if abs(oldY) < 1e-6 else valLgX() * l / oldY)
            av()
        else:                           # E ou O
            oldX = valLgX()
            lgX(l)
            lgY(l if abs(oldX) < 1e-6 else valLgY() * l / oldX)
            av()
    else:                               # non cardinaux
        lgRT(l, valLgT())
        av()


def angle360(a):
    """angle ramene dans [0, 360["""
    r = math.fmod(a, 360.)
    return r + 360. if r < 0. else r


def rt(t):
    """rotation de t degres (sens direct) + changement de repere"""
    vo = valOrientation()
    an = get_angle(vo)
    # grille degeneree (apres tl 0.) : la direction serait perdue
    if valLgR() < 1e-6:
        lg(1.)
    a = angle360(an + t)
    anrad = deg_to_rad(a)
    cosan = math.cos(anrad)
    sinan = math.sin(anrad)
    if cosan == 1.:
        pe()                                    # est
    elif sinan == 1.:
        pn()                                    # nord
    elif cosan == -1.:
        pw()                                    # ouest
    elif sinan == -1.:
        ps()                                    # sud
    elif cosan > 0.:                            # moitie est
        if sinan > 0.:                          # quart nord-est
            lgRT(valLgR(), a)
            pne()
        else:                                   # quart sud-est
            lgRT(valLgR(), 360. - a)
            pse()
    else:                                       # moitie ouest
        if sinan > 0.:                          # quart nord-ouest
            lgRT(valLgR(), 180. - a)
            pnw()
        else:                                   # quart sud-ouest
            lgRT(valLgR(), a - 180.)
            psw()

# ---------------------------------------------------------------------------
# Positionnement au centre et sur les bords du cadre


def ce():
    """au centre"""
    a = Graph.centrex
    b = Graph.centrey
    draw(False)
    moveto(a, b)
    r_ce(float(a), float(b))
    draw(True)


def eh():
    """en haut"""
    ymax = size_y() - Graph.bsupy
    draw(False)
    moveto(current_point()[0], ymax)
    r_tv(float(ymax))
    draw(True)


def eb():
    """en bas"""
    draw(False)
    moveto(current_point()[0], Graph.binfy)
    r_tv(float(Graph.binfy))
    draw(True)


def ad():
    """a droite"""
    xmax = size_x() - Graph.bsupx
    draw(False)
    moveto(xmax, current_point()[1])
    r_th(float(xmax))
    draw(True)


def ag():
    """a gauche"""
    draw(False)
    moveto(Graph.binfx, current_point()[1])
    r_th(float(Graph.binfx))
    draw(True)

# ---------------------------------------------------------------------------
# Deplacement absolu sur une grille munie d'un repere


def cartes(x, y):
    return (pixel(float(Graph.centrex) + x * valLgX()),
            pixel(float(Graph.centrey) + y * valLgY()))


def deplacer(x, y=None):
    """place le robot au point (x, y) du repere (en carreaux), sans tracer"""
    if y is None:
        (x, y) = x
    (a, b) = cartes(x, y)
    draw(False)
    moveto(a, b)
    r_ce(float(a), float(b))
    draw(True)

# ---------------------------------------------------------------------------
# Initialisation avec une couleur de fond choisie


indice_cf = 0


def valCf():
    return indice_cf


def cf(n):
    global indice_cf
    init_pict()
    cc(n)
    indice_cf = n
    fill_rect(0, 0, size_x(), size_y())
    draw(True)
    draw_bar()
    cc(7)
    show_color()
    bc()
    vt(10)
    ec(1)
    interdireSorties()
    montrerRobot()
    pn()
    ce()

# ---------------------------------------------------------------------------
# Memoire des interactions


commandes = []              # commandes passees (fonctions), la derniere en tete
str_commandes = []          # les memes, en texte Python


def empile_fun(f):
    commandes.insert(0, f)


def empile_str(s):
    str_commandes.insert(0, s)


def depile():
    del commandes[0]
    del str_commandes[0]


def my_undo(l):
    for f in l:
        f()


def my_undo_bis(l):
    for f in l:
        f()
        wait()


def undo():
    """retire la derniere commande (et redessine les autres)"""
    if commandes:
        set_color(current_color()); show_color()
        # retirer la commande des deux piles : sinon elle reste dans le
        # texte sauve dans mon_dessin.py
        reste = list(reversed(commandes[1:]))
        depile()
        my_undo(reste)
        # la couleur courante est celle rejouee
        show_color()

# ---------------------------------------------------------------------------


sauvegarde = False
fichier_dessin = "mon_dessin.py"


def texte_dessin():
    """le programme Python du dessin : les commandes, plusieurs par ligne ;
    un changement de couleur (cc avec le nom de la couleur en commentaire)
    finit la ligne"""
    lignes = []
    ligne = ""
    for s in reversed(str_commandes):
        if ligne and len(ligne) + len(s) > 72:
            lignes.append(ligne)
            ligne = ""
        if "#" in s:
            code, com = s.split("#", 1)
            ligne = (ligne + "; " if ligne else "") + code.strip()
            lignes.append(ligne + "  #" + com)
            ligne = ""
        else:
            ligne = (ligne + "; " if ligne else "") + s
    if ligne:
        lignes.append(ligne)
    return ("# Mon joli dessin\n"
            "from LeRobot import *\n"
            "\n"
            "init_pict(); ce()\n"
            + "".join(l + "\n" for l in lignes))


def _message_bar(texte):
    moveto(17, yTexteBar)
    set_color(blanc)
    fill_rect(0, 0, size_x() - 1, hBar - 1)
    set_color(bleu)
    draw_string(texte)


def st():
    """fin du programme : on peut changer la vitesse (+ et -) et redessiner
    (autre touche) ; Echap ferme la fenetre"""
    while True:
        if sauvegarde:
            _message_bar(" Voulez-vous sauver dans " + fichier_dessin + " ? (y/n) ")
            if read_key() == "y":
                with open(fichier_dessin, "w") as f:
                    f.write(texte_dessin())
                moveto(17, yTexteBar)
            raise Stop()
        _message_bar("  + : plus vite   - : moins vite   vitesse : " + str(v)
                     + "     autre touche : redessiner   Echap : quitter")
        motion = wait_next_event([Key_pressed])
        # + et - changent seulement la vitesse (en 1998 ils relancaient
        # aussi le dessin) ; une autre touche redessine
        if motion.key == "+":
            increase_vt()
        elif motion.key == "-":
            decrease_vt()
        elif motion.key in ("\x1b", "#"):
            close_graph()
            return
        else:
            init_pict(); ce(); pn()
            my_undo_bis(list(reversed(commandes)))

# ===========================================================================
# Peinture


def direction_derriere():
    """point de depart du remplissage en fonction du robot"""
    return [(0, -1), (-1, -1), (-1, 0), (-1, 1),
            (0, 1), (1, 1), (1, 0), (1, -1)][valOrientation()]


def point_de_depart():
    (dx, dy) = direction_derriere()
    return (pixel(valX()) + dx, pixel(valY()) + dy)


def peindre():
    """peint, de la couleur du crayon, la zone fermee derriere le robot"""
    (dx, dy) = direction_derriere()
    x = pixel(valX())
    y = pixel(valY())
    # effacer le robot AVANT de lire la couleur du point de depart
    draw(False)

    # le point juste derriere le robot tombe souvent sur un trait quand le
    # robot est dans un coin (traits a 30 ou 60 degres) : s'il est sur un
    # trait (noir ou de la couleur courante), on essaie 1 ou 2 pixels plus
    # loin dans la meme direction
    def sur_un_trait(c):
        return c == current_color() or c == black

    k = 1
    while True:
        a = x + k * dx
        b = y + k * dy
        if not sur_un_trait(point_color(a, b)) or k == 3:
            break
        k += 1
    fond = point_color(a, b)
    if fond != current_color() and fond != -1:
        Peinture.remplir(fond, a, b)
        set_line_width(valEc())
    draw(True)
