from LibRobot import *

# Dessiner une serpentine pyramidale
tailleGrille = 6
hauteur = 28

lg(tailleGrille); eh(); pqtd()
for i in range(1, hauteur + 1):
    avf(i)
    if i % 2 == 1:
        pqtd(); av(); pqtd()
    else:
        pqtg(); av(); pqtg()
st()
