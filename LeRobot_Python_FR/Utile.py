"""Utile -- constantes et fonctions utilitaires (traduction de utile.ml).

Les types valeur / expression de utile.ml (restes d'un interprete de la
version Caml Light, inutilises par le robot) ne sont pas repris.
"""

pi = 3.1415926535


def deg_to_rad(x):
    return x * pi / 180.


def rad_to_deg(x):
    return x * 180. / pi


def assoc_bool(a, liste):
    for (f, v) in liste:
        if f(a):
            return v
    raise Exception("echec assoc_bool <utile>")


def normalise(a):
    while abs(a) > 360.:
        a = a - 360. if a > 0. else a + 360.
    return a


class Undefined_variable(Exception):
    pass


class Undefined_prim_op(Exception):
    pass


class Type_mismatch(Exception):
    pass


class Stop(Exception):
    """Arret du dessin (touche Echap, fin de Dessiner)"""
    pass
