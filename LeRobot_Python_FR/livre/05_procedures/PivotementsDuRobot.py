from LibRobot import *

# Les pivotements du robot définis par des procédures

# Fait pivoter le robot sur place d'un quart de tour
# à droite
def pqtd():
    phtd(); phtd()

# Fait pivoter le robot sur place d'un quart de tour
# à gauche
def pqtg():
    phtg(); phtg()

# Fait pivoter le robot sur place de 3 huitièmes de
# tour à droite
def p3htd():
    pqtd(); phtd()

# Fait pivoter le robot sur place de 3 huitièmes de
# tour à gauche
def p3htg():
    pqtg(); phtg()

# Fait pivoter le robot sur place d'un demi-tour
def pdt():
    pqtd(); pqtd()

av(); pqtd(); av(); pqtg(); av(); p3htd(); av()
p3htg(); av(); pdt(); av()
st()
