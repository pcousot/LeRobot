from LibRobot import *

# Dessiner une frise en forme de double peigne
nombreDeDents = 30

ag(); pe()
for i in range(1, nombreDeDents + 1):
    # Trait horizontal
    av()
    if i % 2 == 1:
        # Dent vers le bas
        pqtd(); av(); pdt(); av(); pqtd()
    # Dent vers le haut
    else:
        pqtg(); av(); pdt(); av(); pqtg()
st()
