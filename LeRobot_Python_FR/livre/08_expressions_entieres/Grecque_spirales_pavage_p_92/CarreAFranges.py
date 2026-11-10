from LibRobot import *

# Dessiner un carré à franges
# Monter
lc()
for i in range(3):
    av()
bc()
# Dessiner le carré à franges
for i in range(1, 5):
    # Dessiner un côté du carré avec 5 franges de
    # longueurs i + 1, i + 2, ..., i + 5.
    for j in range(1, 6):
        # Dessiner une frange de longueur (i + j).
        for k in range(i + j):
            av()
        pdt()
        for k in range(i + j):
            av()
        # Passer à la frange suivante.
        pqtg(); av(); pqtg()
    # Tourner le robot perpendiculairement au côté
    # suivant.
    pqtd()
st()
