from LibRobot import *

# Dessiner une courbe spirolatérale de Frank C. Odds
# à 90 degrés d'ordre 9.
lc(); avf(-4); bc()
for i in range(4):
    for j in range(1, 10):
        avf(j); pqtd()
st()
