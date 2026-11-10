from LibRobot import *

# Pavage de croix biseautées inscrites dans un
# carré (6 x 6)
tailleGrilleX = 6
tailleGrilleY = 6

# Dessiner un motif dans un carré (6 x 6), le robot
# partant et arrivant au centre du motif, orienté
# vers le nord.
def motif6x6():
    for i in range(4):
        phtd(); av(); phtd(); av(); av(); p3htd()
        av(); pqtg(); av(); p3htd(); av(); av()
        phtd(); av(); phtg()

# Paver avec y lignes de x motifs (6 x 6)
def pavage(x, y):
    # Décentrer le dessin à gauche de la moitié de la
    # longueur d'une ligne et vers le haut de la
    # moitié de la hauteur du pavage.
    translater(-(6 * (x // 2)), 6 * (y // 2))
    # Dessiner (y - 1) lignes de x motifs (avec
    # translation en bas à gauche de la ligne
    # suivante).
    for i in range(y - 1):
        # Dessiner une ligne de x motifs (sans
        # translation à droite après le dernier motif
        # de la ligne).
        for j in range(x - 1):
            motif6x6()
            # Passer au motif suivant à droite dans la
            # même ligne.
            translater(6, 0)
        motif6x6()
        # Passer au début de la ligne suivante.
        translater(-(6 * (x - 1)), -6)
    # Dessiner la dernière ligne de x motifs (sans
    # translation en bas à gauche de la ligne
    # suivante).
    for j in range(x - 1):
        motif6x6()
        translater(6, 0)
    motif6x6()

lgX(tailleGrilleX); lgY(tailleGrilleY)
pavage(4, 4)
st()
