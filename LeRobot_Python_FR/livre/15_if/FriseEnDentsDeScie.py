from LibRobot import *

# Dessiner une frise en dents de scie
nombreDeDents = 31

ag(); phtd()
for i in range(2 * nombreDeDents):
    av()
    if tne():
        p3htd()
    else:
        p3htg()
st()
