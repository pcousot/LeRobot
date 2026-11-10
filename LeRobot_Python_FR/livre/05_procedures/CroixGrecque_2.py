from LibRobot import *

# Dessiner une croix grecque
def cote():
    av(); av(); av()

def extremite():
    pqtg(); av(); pqtg()

# Dessiner le côté gauche, l'extrémité puis le côté
# droit d'une branche, et orienter le robot en
# direction de la branche suivante.
def branche():
    cote(); extremite(); cote(); pqtd()

def croix():
    branche(); branche(); branche(); branche()

croix(); st()
