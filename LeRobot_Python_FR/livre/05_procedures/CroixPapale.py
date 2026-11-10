from LibRobot import *

# Dessiner une croix papale

# Dessiner une branche de longueur 1
def branche1():
    pqtd(); av(); pqtg(); av(); pqtg(); av(); pqtd()

# Dessiner une branche de longueur 2
def branche2():
    pqtd(); av(); av(); pqtg(); av(); pqtg()
    av(); av(); pqtd()

# Dessiner une demi-croix
def demiCroix():
    av(); branche1(); av(); branche2(); av()
    branche1(); av(); pqtg(); av()

def croix():
    demiCroix(); pqtg(); demiCroix()

croix(); st()
