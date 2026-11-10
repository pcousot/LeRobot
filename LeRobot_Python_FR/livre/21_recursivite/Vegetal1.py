from LibRobot import *

# Végétal fractal
l = 2  # Longueur des rameaux
a = 26  # Angle des rameaux

# Parcourir un arbre de taille n de haut en bas
def retour(n):
    if n == 0:
        tl(l)
    else:
        retour(n - 1)
        retour(n - 1)
        retour(n - 1)

def arbre(n):
    if n == 0:
        tl(l)
    else:
        arbre(n - 1)
        rt(-a)
        arbre(n - 1); lc(); rt(180); retour(n - 1)
        rt(180); bc()
        rt(a)
        arbre(n - 1)
        rt(a)
        arbre(n - 1); lc(); rt(180); retour(n - 1)
        rt(180); bc()
        rt(-a)
        arbre(n - 1)

eb(); arbre(4); st()
