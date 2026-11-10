from LibRobot import *

# Dessiner une chenille
tailleGrille = 6
nombreDAnneaux = 7

# Décentrer à gauche de la moitié de la longueur
# de la chenille
def aGauche(n):
    lg(2 * tailleGrille)
    lc(); pqtg(); avf(n); pqtd(); bc()

# Dessiner le dos de la chenille comportant n
# anneaux de rayon égal à (2 * tailleGrille)
def dos(n):
    lg(2 * tailleGrille)
    for i in range(n):
        vd(); vd(); pdt()
    pdt(); vd()

# Dessiner une patte de la chenille de longueur
# tailleGrille
def patte():
    lg(tailleGrille)
    pqtg(); av(); pdt(); av(); pqtg()

# Dessiner p pattes de la chenille espacées de
# (2 * tailleGrille)
def pattes(p):
    patte()
    for i in range(p - 1):
        lg(2 * tailleGrille); av()
        patte()

# Dessiner la tête de la chenille
def tete():
    lg(tailleGrille); vd(); vd()
    # Oeil
    lc(); lg(2 * tailleGrille); av()
    pqtg(); bc(); dc(); cc(jaune); peindre()

# Dessiner une chenille de n anneaux et (2 * n)
# pattes
def chenille(n):
    aGauche(n); dos(n); pattes(2 * n); tete()

chenille(nombreDAnneaux); st()
