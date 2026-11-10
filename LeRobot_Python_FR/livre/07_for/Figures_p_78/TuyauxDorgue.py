from LibRobot import *

# Dessiner des tuyaux d'orgue
pqtd()
for i in range(1, 11):
    av(); pqtg()
    for j in range(i):
        av()
    pqtd(); av(); pqtd()
    for j in range(i):
        av()
    pqtg()
st()
