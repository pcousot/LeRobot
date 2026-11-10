from LibRobot import *

# Dessiner une spirolatérale d'ordre 3 à 135 degrés
lg(20)
for i in range(8):
    rt(135)
    av(); rt(-135)
    av(); av(); rt(-135)
    av(); av(); av()
st()
