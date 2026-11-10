from LibRobot import *

# Dessiner une frise de T
def dessinerT():
    # Côté gauche
    av(); pqtg(); av(); pqtg(); av(); pqtd(); av()
    # Dessus
    pqtd(); av(); av(); av(); pqtd()
    # Côté droit
    av(); pqtd(); av(); pqtg(); av(); pqtg(); av()

ag(); pqtd()
for t in range(10):
    dessinerT()
    av()  # passer au T suivant
st()
