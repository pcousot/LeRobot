from LibRobot import *

# Dessiner une frise de tildes

# Dessiner un motif en forme de tilde ~
def tilde():
    phtd(); av(); phtd(); av()
    pqtd(); av(); av(); pqtg()
    av(); phtg(); av()

ag()
for i in range(10):
    tilde()
    # Reculer au début du tilde suivant
    lc(); p3htg(); av(); bc()
    # Orienter le robot au nord
    pqtd()
st()
