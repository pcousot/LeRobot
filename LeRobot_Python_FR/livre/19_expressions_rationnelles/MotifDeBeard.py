from LibRobot import *

# Motif de R. S. Beard
grilleInitiale = 3  # au moins 3
nbCouronnes = 4

def carreNoirDroit():
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    phtg(); peindre(); pdt(); av()

def carreNoirOblique():
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    lc(); p3htd(); av(); peindre(); av(); bc()

def couronne():
    for i in range(4):
        carreNoirDroit()
        lg(valLgX() / sqrt(2))
        carreNoirOblique()
        lg(valLgX() * sqrt(2))

def motif():
    for i in range(nbCouronnes - 1):
        couronne()
        # Placer le robot au coin inférieur gauche du carré
        # supérieur gauche de la couronne suivante
        lc(); av(); pqtg()
        lg(valLgX() * tan(3 * pi / 8))
        av(); pqtd(); bc()
    couronne()

lg(grilleInitiale); motif(); st()
