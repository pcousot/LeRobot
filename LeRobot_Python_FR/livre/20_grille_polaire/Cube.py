from LibRobot import *

# Dessiner le développement d'un cube
cote = 18

def carre():
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    pqtd(); av()

eb(); lg(cote)
carre(); carre(); carre()
pqtg(); av(); pqtd(); carre()
pqtd(); av(); pqtg(); carre()
pqtd(); av(); pqtd(); av(); pqtg(); carre()
st()
