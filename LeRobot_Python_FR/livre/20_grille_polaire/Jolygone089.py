from LibRobot import *

# Dessiner un jolygone à 89 degrés
longueurInitiale = 250
angle = 89
nbrSegments = 80

eb(); ag()
lg(longueurInitiale); pqtd(); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
