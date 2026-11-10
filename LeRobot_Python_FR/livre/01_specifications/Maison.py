# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Maison, page 9.                                     *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner une maison
# Descendre sans dessiner
lc(); pqtd(); pqtd(); av(); av(); av(); av(); av(); av(); pqtd(); pqtd()
bc()
# Mur gauche de la maison
av(); av(); av(); av(); av(); av(); av()
# Toit de la maison
# Pente gauche
phtd(); av(); av(); av(); av(); av()
# Pente droite
pqtd(); av(); av(); av(); av(); av()
# Dessous du toit
p3htd(); av(); av(); av(); av(); av(); av(); av(); av(); av(); av()
# Retraverser à droite sans dessiner
lc(); pqtd(); pqtd(); av(); av(); av(); av(); av(); av(); av(); av(); av()
av(); bc()
# Mur droit
pqtd(); av(); av(); av(); av(); av(); av(); av()
# Sol
pqtd(); av(); av(); av(); av(); av(); av(); av(); av(); av(); av()
# Monter sans dessiner vers la fenêtre
lc(); pqtd(); av(); av(); av(); av(); av(); av(); pqtd(); av(); bc()
# Fenêtre
# Bord
av(); av(); pqtd(); av(); av(); pqtd(); av(); av(); pqtd(); av(); av()
pqtd()
# Carreaux
av(); pqtd(); av(); av()
lc(); pqtd(); av(); pqtd(); av(); bc()
pqtd(); av(); av()
# Rejoindre la porte sans dessiner
lc(); av(); pqtd(); av(); pqtg(); av(); bc()
# Porte
av(); av(); av(); pqtd()
av(); av(); av(); av(); pqtd()
av(); av(); av(); pqtd()
av(); av()
# Clenche
pqtd(); av(); pqtd(); pqtd(); av(); pqtd()
av(); av()
# Rejoindre la cheminée sans dessiner
lc(); av(); av(); av(); av(); av(); av(); pqtd(); av(); av(); bc()
# Cheminée
pqtg(); av(); pqtd(); av(); av(); pqtd(); av(); av(); av()
# Rejoindre le haut de la cheminée sans dessiner
pqtd(); pqtd(); av(); av(); av(); pqtg(); av()
# Fumée
pqtd(); vd(); vg(); vd()
# Arrêter le robot
st()
