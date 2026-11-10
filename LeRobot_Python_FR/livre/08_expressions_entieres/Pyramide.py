from LibRobot import *

# Dessiner une pyramide de 5 étages.
# Orienter le robot à l'ouest.
pqtg()
for i in range(1, 6):
    # Partant du coin inférieur gauche d'un étage avec le
    # robot orienté à l'ouest, dessiner le coin inférieur
    # gauche de l'étage inférieur et pivoter à l'est.
    av(); pqtg(); av(); pqtg()
    # Dessiner le i-ème étage rectangulaire.
    # Côté inférieur
    for j in range(2 * i - 1):
        av()
    # Extrémité droite
    pqtg(); av(); pqtg()
    # Côté supérieur
    for j in range(2 * i - 1):
        av()
    # Redescendre au coin inférieur gauche et orienter
    # le robot à l'ouest.
    pqtg(); av(); pqtd()
st()
