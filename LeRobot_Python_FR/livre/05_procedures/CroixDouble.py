from LibRobot import *

# Dessiner une croix double

# Dessiner une branche de la croix
def branche():
    pqtg(); av(); av(); pqtd(); av(); pqtd()
    av(); av(); pqtg()

# Dessiner la moitié de la croix
def moitie():
    av(); av(); branche(); av(); branche()
    av(); av(); pqtd(); av(); pqtd()

def croix():
    moitie(); moitie()

croix(); st()
