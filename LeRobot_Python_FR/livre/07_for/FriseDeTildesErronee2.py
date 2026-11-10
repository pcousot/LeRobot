from LibRobot import *

# Dessiner une frise de tildes (deuxième erreur)

# Dessiner un motif en forme de tilde ~
def tilde():
    phtd(); av(); phtd(); av()
    pqtd(); av(); av(); pqtg()
    av(); phtg(); av()

for i in range(13):
    tilde()
    # Reculer au début du tilde suivant
    lc(); p3htg(); av(); bc()
st()
