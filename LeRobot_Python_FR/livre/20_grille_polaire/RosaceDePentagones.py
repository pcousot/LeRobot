from LibRobot import *

# Dessiner une rosace de dix pentagones
longueurCote = 40

pqtd(); lg(longueurCote)
for i in range(10):
    rt(36)
    for j in range(5):
        av(); rt(72)
st()
