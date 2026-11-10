from LibRobot import *

# Dessiner une hélice singulière
xbase = 13  # Largeur de la grille de base
ybase = 8  # Hauteur de la grille de base
nombreDeFeuilles = 8  # Feuilles d'une pale
nombreDePales = 4  # Pales de l'hélice

def pale():
    for i in range(1, nombreDeFeuilles + 1):
        # Dessiner un quart d'ellipse, de dimension
        # (xbase * i, ybase * i), sans changer
        # l'orientation initiale du robot
        lgX(xbase * i)
        lgY(ybase * i)
        av(); pqtg(); av(); pqtg(); vg(); pqtg()

for j in range(nombreDePales):
    pale(); pqtd()
st()
