from LibRobot import *

# Dessiner le motif de la grecque polygonale
fg = 6  # Facteur de grossissement

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

pe(); motif(); st()
