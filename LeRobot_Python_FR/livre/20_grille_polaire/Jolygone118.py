from LibRobot import *

# Dessiner un jolygone à 118 degrés
longueurInitiale = 300
angle = 118
nbrSegments = 80

eb(); ag()
lg(longueurInitiale); pqtd(); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
