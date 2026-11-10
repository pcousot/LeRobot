from LibRobot import *

# Dessiner un jolygone à 175 degrés
longueurInitiale = 350
angle = 175
nbrSegments = 40

ag()
lg(longueurInitiale); pqtd(); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
