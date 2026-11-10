from LibRobot import *

# Motif du pavage de quadrilatères inscrit dans un
# carré (6 x 6)

# Dessiner un motif dans un carré (6 x 6), le robot
# partant et arrivant au centre du motif, orienté
# vers le nord.
def motif():
    for i in range(4):
        lc(); pqtg(); av(); bc()
        p3htd(); av(); av(); pqtg(); av(); pdt(); av()
        phtg(); av(); av(); pdt(); av(); pqtd(); av()
        pqtd(); av()
        lc(); p3htd(); av(); av(); av(); bc()
        phtd()

motif(); st()
