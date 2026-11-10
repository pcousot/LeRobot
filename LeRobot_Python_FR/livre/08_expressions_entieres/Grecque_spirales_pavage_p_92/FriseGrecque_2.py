from LibRobot import *

# Dessiner une frise grecque avec des boucles
# imbriquées
ag()
for i in range(8):
    for j in range(4):
        av()
    pqtd()
    for j in range(1, 5):
        for k in range(5 - j):
            av()
        pqtd()
    av(); pqtg()
    for j in range(1, 5):
        for k in range(j):
            av()
        pqtg()
st()
