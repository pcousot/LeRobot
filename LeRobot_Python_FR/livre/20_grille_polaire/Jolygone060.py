from LibRobot import *

# Dessiner un jolygone à 60 degrés
longueurInitiale = 150
angle = 60
nbrSegments = 80

eb(); lc(); avf(3); bc()
lg(longueurInitiale); av()
for i in range(nbrSegments - 1):
    rt(angle); tl(valLgTl() * 0.95)
st()
