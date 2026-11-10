"""Robot -- definition du robot, operations relatives, crayon et tests
(traduction de Robot.ml).

Le robot a une position (x, y) en flottants, arrondie au pixel pour le
dessin (pixel), une orientation theta (0 = N, 1 = NE, 2 = E, ... 7 = NO),
un crayon (trace : baisse ou leve) et une epaisseur de crayon ep.
"""
from Graphics import set_line_width
from Grille import valLgX, valLgY, valLgR, valLgT
from Graph import testbornes


def pixel(v):
    """position -> pixel : on arrondit (et non on tronque). Les rangees d'un
    pavage tombent sur des ordonnees comme 642.99 et 617.01 : tronquees
    (642, 617) elles ne sont plus a 26 pixels l'une de l'autre, et les traits
    et le point de depart de peindre se decalent d'un pixel d'une rangee a
    l'autre (PavageHexagonalOndule ne peignait que la premiere rangee).
    (round de Python arrondit les demis au pair : on arrondit comme OCaml,
    a l'oppose de zero.)"""
    import math
    if v != v:
        return 0                        # nan (grille degeneree)
    return int(math.floor(v + 0.5)) if v >= 0 else -int(math.floor(-v + 0.5))


class robot:
    def __init__(self, x, y, theta, trace, ep):
        self.x = x
        self.y = y
        self.theta = theta
        self.trace = trace
        self.ep = ep

    def copie(self, **changements):
        r = robot(self.x, self.y, self.theta, self.trace, self.ep)
        for k, v in changements.items():
            setattr(r, k, v)
        return r


def get_angle(n):
    """conversion orientation -> angle"""
    gt = valLgT()
    return [90., gt, 0., 360. - gt, 270., 180. + gt, 180., 180. - gt][n]


# le robot (la "reference" probot de la version OCaml)
probot = robot(250., 250., 0, True, 1)

# longueur du dernier trace
lgTl = 0.

# ---------------------------------------------------------------------------
# Consultation des valeurs


def valBc():
    return probot.trace


def valEc():
    return probot.ep


def valX():
    return probot.x


def valY():
    return probot.y

# ---------------------------------------------------------------------------
# Tests de l'orientation


def tn(): return probot.theta == 0      # nord ?
def tne(): return probot.theta == 1     # nord-est ?
def te(): return probot.theta == 2      # est ?
def tse(): return probot.theta == 3     # sud-est ?
def ts(): return probot.theta == 4      # sud ?
def tsw(): return probot.theta == 5     # sud-ouest ?
def tw(): return probot.theta == 6      # ouest ?
def tnw(): return probot.theta == 7     # nord-ouest ?


def valOrientation():
    return probot.theta

# ---------------------------------------------------------------------------
# Operations sur le crayon


def my_lc(rob):
    return rob.copie(trace=False)


def r_lc():
    probot.trace = False


def r_bc():
    probot.trace = True


def ec(n):
    """epaisseur du crayon"""
    probot.ep = n
    set_line_width(n)

# ---------------------------------------------------------------------------
# Rotations


def my_pivote(theta, rob):
    """robot de meme position, oriente selon theta"""
    return rob.copie(theta=theta, ep=probot.ep)


def r_pn(): probot.theta = 0            # pivoter nord
def r_pne(): probot.theta = 1           # pivoter nord-est
def r_pe(): probot.theta = 2            # pivoter est
def r_pse(): probot.theta = 3           # pivoter sud-est
def r_ps(): probot.theta = 4            # pivoter sud
def r_psw(): probot.theta = 5           # pivoter sud-ouest
def r_pw(): probot.theta = 6            # pivoter ouest
def r_pnw(): probot.theta = 7           # pivoter nord-ouest


# rotations relatives : nombre de huitiemes de tour a droite
def my_tourne(huitiemes, rob):
    return my_pivote((rob.theta + huitiemes) % 8, rob)


def my_phtd(rob): return my_tourne(1, rob)     # huitieme a droite
def my_phtg(rob): return my_tourne(7, rob)     # huitieme a gauche
def my_pqtd(rob): return my_tourne(2, rob)     # quart a droite
def my_pqtg(rob): return my_tourne(6, rob)     # quart a gauche
def my_p3htd(rob): return my_tourne(3, rob)    # 3 huitiemes a droite
def my_p3htg(rob): return my_tourne(5, rob)    # 3 huitiemes a gauche
def my_pdt(rob): return my_tourne(4, rob)      # demi-tour


def r_phtd(): probot.theta = (probot.theta + 1) % 8
def r_phtg(): probot.theta = (probot.theta + 7) % 8
def r_pqtd(): probot.theta = (probot.theta + 2) % 8
def r_pqtg(): probot.theta = (probot.theta + 6) % 8
def r_p3htd(): probot.theta = (probot.theta + 3) % 8
def r_p3htg(): probot.theta = (probot.theta + 5) % 8
def r_pdt(): probot.theta = (probot.theta + 4) % 8


def r_pivoter(n):
    probot.theta = [0, 1, 2, 3, 4, 5, 6, 7][n]

# ---------------------------------------------------------------------------
# Deplacements relatifs


_pas = [(0., 1.), (1., 1.), (1., 0.), (1., -1.),
        (0., -1.), (-1., -1.), (-1., 0.), (-1., 1.)]


def r_translater(a, b):
    probot.x = a
    probot.y = b


def my_av(rob):
    """robot ayant avance tout droit"""
    (dx, dy) = _pas[rob.theta]
    return rob.copie(x=rob.x + dx * valLgX(), y=rob.y + dy * valLgY(), ep=probot.ep)


def r_av_effect():
    global lgTl
    (dx, dy) = _pas[valOrientation()]
    dl = [valLgY, valLgR, valLgX, valLgR, valLgY, valLgR, valLgX, valLgR][valOrientation()]
    lgTl = dl()                         # mise a jour longueur de trace
    probot.x = probot.x + dx * valLgX()
    probot.y = probot.y + dy * valLgY()

# ---------------------------------------------------------------------------
# Tests de bord. Ils arrondissent la position : apres des rotations, un robot
# revenu sur le bord (eb) est a 25.998 au lieu de 26 et serait considere
# comme sorti (Rapporteur)


arrondi = pixel


def tb():
    """vrai si av () fait sortir le robot du cadre"""
    nouveau = my_av(probot)
    return not testbornes(arrondi(nouveau.x), arrondi(nouveau.y))


def tbvd():
    """vrai si vd () fait sortir le robot du cadre"""
    toto = my_av(my_phtd(probot))
    return not testbornes(arrondi(toto.x), arrondi(toto.y))


def tbvg():
    """vrai si vg () fait sortir le robot du cadre"""
    toto = my_av(my_phtg(probot))
    return not testbornes(arrondi(toto.x), arrondi(toto.y))

# ---------------------------------------------------------------------------
# Virages : ils rendent les arguments de draw_arc (centre, rayons, angles)
# et deplacent le robot


def vd_cardinaux():
    """virage a droite, l'orientation de depart etant un point cardinal"""
    tmp = my_av(my_pqtd(my_lc(probot)))
    start_angle = pixel(get_angle(probot.theta))
    end_angle = pixel(get_angle(my_pdt(tmp).theta))
    sud = ts()
    r_lc()
    r_phtd(); r_av_effect(); r_phtd()
    r_bc()
    # vers le sud, l'arc est trace jusqu'a 360 et non jusqu'a 0
    return (pixel(tmp.x), pixel(tmp.y), pixel(valLgX()), pixel(valLgY()),
            start_angle, 360 if sud else end_angle)


# pour la determination du centre (cas non cardinaux)
dr = [(0., 1.), (1., 1.), (1., 0.), (1., -1.),
      (0., -1.), (-1., -1.), (-1., 0.), (-1., 1.)]

# les angles de la tangente pour un virage a droite
vect_angle_droite = [(0, 0), (135, 45), (0, 0), (1, 1),
                     (0, 0), (315, 225), (0, 0), (135, 225)]


def _non_cardinaux(n, tmp, vect, tourner, nom):
    x0 = valLgX()
    y0 = valLgY()
    (cx, cy) = dr[tmp.theta]
    centre_x = pixel(tmp.x + cx * x0 / 2.)      # centre de l'ellipse
    centre_y = pixel(tmp.y + cy * y0 / 2.)
    rx = pixel(x0 / 2. ** 0.5)                  # rayons
    ry = pixel(y0 / 2. ** 0.5)
    if n == 0:                                  # cas standard
        (debut, fin) = vect[probot.theta]
        r_lc()
        tourner(); r_av_effect(); tourner()
        r_bc()
        return (centre_x, centre_y, rx, ry, debut, fin)
    elif n == 1:                                # arc en deux fois :
        return (centre_x, centre_y, rx, ry, 0, 45)   # passage par l'angle 0
    elif n == 2:
        r_lc()
        tourner(); r_av_effect(); tourner()
        r_bc()
        return (centre_x, centre_y, rx, ry, 315, 360)
    else:
        raise Exception("Appel illegal : " + nom)


def vd_non_cardinaux(n):
    return _non_cardinaux(n, my_pqtd(probot), vect_angle_droite, r_phtd,
                          "vd_non_cardinaux")


def vg_cardinaux():
    """virage a gauche, l'orientation de depart etant un point cardinal"""
    tmp = my_av(my_pqtg(my_lc(probot)))
    start_angle = pixel(get_angle(probot.theta))
    end_angle = pixel(get_angle(my_pdt(tmp).theta))
    est = te()
    r_lc()
    r_phtg(); r_av_effect(); r_phtg()
    r_bc()
    # vers l'est, l'arc est trace depuis 360 et non depuis 0
    return (pixel(tmp.x), pixel(tmp.y), pixel(valLgX()), pixel(valLgY()),
            360 if est else start_angle, end_angle)


# les angles de la tangente pour un virage a gauche
vect_angle_gauche = [(0, 0), (1, 1), (0, 0), (315, 225),
                     (0, 0), (135, 225), (0, 0), (135, 45)]


def vg_non_cardinaux(n):
    return _non_cardinaux(n, my_pqtg(probot), vect_angle_gauche, r_phtg,
                          "vg_non_cardinaux")

# ---------------------------------------------------------------------------
# positionnement au centre et sur les bords du cadre


def r_ce(x, y):
    probot.x = x
    probot.y = y


def r_tv(z):
    probot.y = z


def r_th(z):
    probot.x = z
