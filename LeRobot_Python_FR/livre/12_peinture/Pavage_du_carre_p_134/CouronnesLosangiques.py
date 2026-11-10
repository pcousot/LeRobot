from LibRobot import *

# Couronnes losangiques peintes une sur deux
nbCarres = 7  # Nombre de carrés (supposé impair)

phtd()
# Dessiner un point (carré de côté nul)
dp()
for i in range(1, nbCarres + 1):
    # Placer le robot au point de départ du tracé du
    # carré suivant
    p3htg(); lc(); av(); p3htd(); bc()
    # Dessiner un carré de côté i, le robot partant
    # et revenant au coin inférieur gauche, orienté
    # au nord-ouest
    for j in range(4):
        avf(i); pqtd()
# Peindre une couronne sur deux
ce(); phtg(); lc()
for i in range(nbCarres // 2):
    av(); peindre(); av()
# Peindre la dernière couronne de rang impair
av(); peindre()
st()
