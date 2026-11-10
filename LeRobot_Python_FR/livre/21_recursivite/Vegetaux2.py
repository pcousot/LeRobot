from LibRobot import *

# Végétaux fractals d'ordres 1 à 4
a = 45  # Angle des rameaux

# Parcourir un arbre de taille n de haut en bas,
# l étant la longueur des rameaux
def retour(l, n):
    if n == 0:
        tl(l)
    else:
        retour(l, n - 1)
        retour(l, n - 1)
        retour(l, n - 1)

# Dessiner un arbre de taille n, l étant la longueur
# des rameaux
def arbre(l, n):
    if n == 0:
        tl(l)
    else:
        arbre(l, n - 1)
        arbre(l, n - 1)
        rt(-a)
        arbre(l, n - 1); lc(); rt(180); retour(l, n - 1)
        rt(180); bc()
        rt(2 * a)
        arbre(l, n - 1); lc(); rt(180); retour(l, n - 1)
        rt(180); bc()
        rt(-a)
        arbre(l, n - 1)

def troisPuissance(n):
    if n <= 0:
        return 1
    else:
        return 3 * troisPuissance(n - 1)

for i in range(1, 5):
    cf(blanc); eb()
    arbre(162 // troisPuissance(i), i)
    marquerUnePause()
st()
