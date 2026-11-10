from LibRobot import *

# Dessiner une frise de pointes de diamants

# Dessiner un rectangle, le robot partant du coin
# inférieur gauche et arrivant au coin inférieur
# droit, orienté vers le nord.
def rectangle():
    av(); av(); pqtd(); av(); av(); av(); av()
    pqtd(); av(); av(); pqtd(); av()
    av(); av(); av()

# Dessiner une pointe de diamant, le robot partant du
# coin inférieur gauche et arrivant au coin inférieur
# droit, orienté vers le nord.
def pointeDeDiamant():
    rectangle()
    p3htd(); av(); pqtg(); av(); pdt(); av(); phtg()
    av(); av(); phtg(); av()
    pdt(); av()
    pqtg(); av(); p3htg()

# Dessiner une frise de dix pointes de diamants
# juxtaposées
def frise():
    for i in range(10):
        pointeDeDiamant()

ag(); frise(); st()
