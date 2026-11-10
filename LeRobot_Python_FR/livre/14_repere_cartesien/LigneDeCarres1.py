from LibRobot import *

# Ligne de carrés (deplacer)

# Carré de côté 1
def carre():
    av(); pqtd()
    av(); pqtd()
    av(); pqtd()
    av(); pqtd()

for i in range(1, 11):
    deplacer(i, i)
    carre()
st()
