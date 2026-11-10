from LibRobot import *

# Dessiner des parallélogrammes sur une grille
# rectangulaire
# Définir la taille de la grille 40 x 20.
lgX(40); lgY(20)
# Dessiner huit parallélogrammes en faisant pivoter
# leur coin inférieur gauche d'un quart de tour
# autour du centre de la grille.
for i in range(8):
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    phtd()
st()
