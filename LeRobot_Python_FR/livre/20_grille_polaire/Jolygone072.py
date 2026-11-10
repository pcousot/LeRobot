from LibRobot import *

# Dessiner un jolygone à 72 degrés
longueurInitiale = 150
angle = 72
nbrSegments = 80

eb(); lc(); av(); av(); bc()
lg(longueurInitiale); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
