from LibRobot import *

# Dessiner une croix de Saint André, c'est-à-dire une
# croix grecque penchée d'un huitième de tour
def cote():
    av(); av(); av()

def extremite():
    pqtg(); av(); pqtg()

def branche():
    cote(); extremite(); cote(); pqtd()

def croixGrecque():
    branche(); branche(); branche(); branche()

def croixDeSaintAndre():
    phtd(); croixGrecque()

croixDeSaintAndre(); st()
