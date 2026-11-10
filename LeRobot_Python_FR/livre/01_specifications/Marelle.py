# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Marelle, page 8.                                    *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner une marelle
def cCarre():
    # Dessine le cote d'un carré
    av(); av(); av(); av(); pqtg()

def carre():
    # Dessine le carré
    cCarre(); cCarre(); cCarre(); cCarre()

# Rejoindre la gauche du cadre
pqtg(); av(); av(); av(); av(); av(); av(); av(); av(); av(); av(); av()
# Dessiner la terre
av(); vg(); av(); av(); vg(); av()
# Dessiner les carres 1, 2, 3
carre(); av(); av(); av(); av(); carre(); av(); av(); av(); av(); carre()
av(); av(); av(); av()
# Dessiner le carre 4
pqtd(); av(); av(); pqtg(); carre()
# Dessiner le carre 5
pqtg(); av(); av(); av(); av(); av(); av(); av(); av(); pqtd(); av(); av()
av(); av(); pqtd(); av()
av(); av(); av(); av(); av()
# Dessiner le carre 6
pqtg(); carre(); av(); av(); av(); av()
# Dessiner le carre 7
pqtd(); av(); av(); pqtg(); carre()
pqtg(); av(); av(); av(); av(); av(); av(); av(); av(); pqtd()
# Dessiner le carre 8
av(); av(); av(); av(); pqtd(); av(); av(); av(); av(); av(); av()
# Dessiner le ciel
pqtg(); av(); vg(); av(); av(); vg(); av()
st()
