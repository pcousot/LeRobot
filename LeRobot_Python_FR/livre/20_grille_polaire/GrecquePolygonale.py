from LibRobot import *

# Dessiner une grecque polygonale
fg = 2  # Facteur de grossissement
n = 10  # Nombre de côtés

def motif():
    # Partie gauche
    tl(13 * fg); rt(90); tl(8 * fg); rt(90)
    tl(6 * fg); rt(90); tl(4 * fg); rt(90)
    tl(2 * fg); rt(90); tl(2 * fg); rt(-90)
    tl(2 * fg); rt(-90); tl(4 * fg); rt(-90)
    tl(6 * fg); rt(-90); tl(8 * fg); rt(-90)
    tl(18 * fg); rt(-90)
    # Partie symétrique droite
    tl(8 * fg); rt(-90); tl(6 * fg); rt(-90)
    tl(4 * fg); rt(-90); tl(2 * fg); rt(-90)
    tl(2 * fg); rt(90); tl(2 * fg); rt(90)
    tl(4 * fg); rt(90); tl(6 * fg); rt(90)
    tl(8 * fg); rt(90)
    tl(13 * fg)

def grecque():
    for i in range(n):
        motif(); rt(360 / n)

grecque(); st()
