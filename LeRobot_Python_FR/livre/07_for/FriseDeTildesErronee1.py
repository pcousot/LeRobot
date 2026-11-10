from LibRobot import *

# Dessiner une frise de tildes (première erreur)

# Dessiner un motif en forme de tilde ~
def tilde():
    phtd(); av(); phtd(); av()
    pqtd(); av(); av(); pqtg()
    av(); phtg(); av()

for i in range(10):
    tilde()
st()
