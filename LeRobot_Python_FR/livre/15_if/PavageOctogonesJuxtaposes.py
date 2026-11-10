from LibRobot import *

# Pavage d'octogones juxtaposés
tailleGrille = 6

# Placer le robot à gauche de la n-ième ligne de
# pavés
def ligne(n):
    eh(); ag(); lc(); ps()
    for k in range(n - 1):
        avf(2)
    av(); pdt(); bc()

# Dessiner un pavé octogonal
def pave():
    for c in range(8):
        phtd(); av()

# Laisser la place pour le cabochon carré
def placerADroite():
    lc(); pqtd(); avf(4); pqtg(); bc()

# Dessiner une ligne de n pavés
def ligneDePaves(n):
    for p in range(n):
        pave(); placerADroite()

# Décaler les débuts de lignes de rang impair
def decaler():
    lc(); pqtd(); avf(2); pqtg(); bc()

def pavage(nbLignes, nbColonnes):
    for l in range(1, nbLignes + 1):
        ligne(l)
        if l % 2 == 1:
            decaler(); ligneDePaves(nbColonnes - 1)
        else:
            ligneDePaves(nbColonnes)

lg(tailleGrille)
pavage(12, 8)
st()
