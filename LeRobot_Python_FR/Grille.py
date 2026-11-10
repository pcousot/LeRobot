"""Grille -- description de la grille (traduction de Grille.ml).

lX : largeur d'un carreau de la grille,
lY : hauteur d'un carreau de la grille,
oN : angle du Nord avec la hauteur.
Les longueurs sont des flottants.
"""
from math import sqrt, acos
from Utile import rad_to_deg, deg_to_rad
from math import cos, sin


class grille:
    def __init__(self, lX, lY, oN):
        self.lX = lX
        self.lY = lY
        self.oN = oN


# grille de base, et "reference" sur la grille courante
ginit = grille(30., 30., 90.)
pgrille = ginit

# ---------------------------------------------------------------------------
# Consultation des valeurs


def valLgX():
    """largeur du cote"""
    return pgrille.lX


def valLgY():
    """hauteur du cote"""
    return pgrille.lY


def valLgR():
    """longueur de la diagonale"""
    x = pgrille.lX
    y = pgrille.lY
    return sqrt(x * x + y * y)


def valLgT():
    """angle de la diagonale (degres)"""
    r = valLgR()
    if r == 0.:
        return float("nan")        # comme OCaml (0. /. 0.)
    return rad_to_deg(acos(max(-1., min(1., valLgX() / r))))

# ---------------------------------------------------------------------------
# Entree des valeurs


def g_lgX(l):
    pgrille.lX = l


def g_lgY(l):
    pgrille.lY = l


def g_lg(l):
    g_lgX(l)
    g_lgY(l)


def g_lgRT(r, theta):
    g_lgX(r * cos(deg_to_rad(theta)))
    g_lgY(r * sin(deg_to_rad(theta)))
