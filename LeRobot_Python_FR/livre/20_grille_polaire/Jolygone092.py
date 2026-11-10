from LibRobot import *

# Dessiner un jolygone à 92 degrés
longueurInitiale = 200
angle = 92
nbrSegments = 80

eb(); lc(); av(); bc()
lg(longueurInitiale); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
