from LibRobot import *

# Dessiner un jolygone à 15 degrés
longueurInitiale = 60
angle = 15
nbrSegments = 100

eb(); ad(); lc(); avf(2); bc()
lg(longueurInitiale); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
