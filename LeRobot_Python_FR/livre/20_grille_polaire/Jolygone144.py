from LibRobot import *

# Dessiner un jolygone à 144 degrés
longueurInitiale = 200
angle = 144
nbrSegments = 60

eb(); lc(); av(); bc()
lg(longueurInitiale); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
