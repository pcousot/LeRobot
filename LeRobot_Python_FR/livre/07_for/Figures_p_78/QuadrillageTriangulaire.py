from LibRobot import *

# Dessiner un quadrillage triangulaire
# Dessiner 10 lignes de carrés juxtaposés
# horizontalement
pqtd()
for i in range(1, 11):
    # Dessiner une ligne de i carrés juxtaposés
    # horizontalement, en partant en haut à gauche et
    # en arrivant en haut à droite, le robot étant
    # dans les deux cas orienté vers l'est.
    for j in range(i):
        # Dessiner un carré, en partant du coin
        # supérieur gauche et en arrivant au coin
        # supérieur droit, le robot étant dans les deux
        # cas orienté vers l'est.
        for k in range(4):
            av(); pqtd()
        av()
    # Revenir, sans dessiner, au début de la ligne
    # suivante, le robot étant orienté vers l'est au
    # départ et à l'arrivée.
    lc(); pdt()
    for j in range(i):
        av()
    pqtg(); av(); pqtg(); bc()
st()
