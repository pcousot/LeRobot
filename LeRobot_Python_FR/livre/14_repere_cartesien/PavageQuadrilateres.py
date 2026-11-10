from LibRobot import *

# Pavage de quadrilatères produits par un motif
# inscrit dans un carré (6 x 6)
tailleGrilleX = 6
tailleGrilleY = 6
motifX = 6  # Largeur du motif
motifY = 6  # Hauteur du motif

# Dessiner un motif dans un carré (motifX x motifY),
# le robot partant et arrivant au centre du motif,
# orienté vers le nord.
def motif():
    for i in range(4):
        lc(); pqtg(); av(); bc()
        p3htd(); av(); av(); pqtg(); av(); pdt(); av()
        phtg(); av(); av(); pdt(); av(); pqtd(); av()
        pqtd(); av()
        lc(); p3htd(); av(); av(); av(); bc()
        phtd()

# Paver avec y lignes de x motifs
def pavage(x, y):
    # Décentrer le dessin à gauche de la moitié de la
    # longueur d'une ligne et vers le haut de la
    # moitié de la hauteur du pavage.
    translater(-(motifX * (x // 2)), motifY * (y // 2))
    # Dessiner (y - 1) lignes de x motifs (avec
    # translation en bas à gauche de la ligne
    # suivante).
    for i in range(y - 1):
        # Dessiner une ligne de x motifs (sans
        # translation à droite après le dernier motif
        # de la ligne).
        for j in range(x - 1):
            motif()
            # Passer au motif suivant à droite dans la
            # même ligne.
            translater(motifX, 0)
        motif()
        # Passer au début de la ligne suivante.
        translater(-(motifX * (x - 1)), -motifY)
    # Dessiner la dernière ligne de x motifs (sans
    # translation en bas à gauche de la ligne
    # suivante).
    for j in range(x - 1):
        motif()
        translater(motifX, 0)
    motif()

lgX(tailleGrilleX); lgY(tailleGrilleY)
pavage(10, 6)
st()
