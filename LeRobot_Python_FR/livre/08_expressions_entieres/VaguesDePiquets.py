from LibRobot import *

# Dessiner un alignement de piquets en vagues
ag()
for i in range(1, 9):
    for j in range(1, 6):
        for k in range(2):
            for l in range((6 - j) * ((i + 1) % 2) + j * (i % 2)):
                av()
            pdt()
        pqtd(); av(); pqtg()
st()
