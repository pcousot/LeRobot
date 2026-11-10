from LibRobot import *

# Dessiner des carrés concentriques
phtd()
# Dessiner un point (carré de côté nul)
dp()
for i in range(1, 11):
    # Placer le robot au point de départ du tracé du
    # carré suivant.
    p3htg(); lc(); av(); p3htd(); bc()
    # Dessiner un carré, de longueur de côté i, le
    # robot démarrant et retournant au coin inférieur
    # gauche, orienté au NW.
    for j in range(4):
        # Avancer de i positions.
        for k in range(i):
            av()
        pqtd()
st()
