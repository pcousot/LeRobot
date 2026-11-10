from LibRobot import *

# Dessiner une grille de croix
def croix():
    av(); pqtg(); av()
    ec(3); dp(); ec(1)
    pdt(); avf(2); pdt()
    ec(3); dp(); ec(1)
    av(); pqtd(); av()

def colonneDeCroix(n):
    for l in range(n):
        croix()

def enBasColonneSuivante():
    lc(); eb(); pqtd(); avf(2); pqtg(); bc()

def grille(nbLignes, nbColonnes):
    for c in range(1, nbColonnes + 1):
        enBasColonneSuivante()
        if c % 2 == 1:
            av(); colonneDeCroix(nbLignes); av()
        else:
            colonneDeCroix(nbLignes + 1)

ag(); grille(6, 7); st()
