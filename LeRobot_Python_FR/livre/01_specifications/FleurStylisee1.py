# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Fleur stylisée, page 9.                             *
# *                                                     *
# *******************************************************
from LibRobot import *

def petale():
    phtd(); av(); av(); p3htd(); av(); av(); pqtd(); av(); av()

def feuille():
    av(); av(); p3htg(); av(); av(); pqtg(); av(); av()

# Monter
lc(); av(); av(); bc()
# Dessiner les pétales
for p in range(4):
    petale()
pdt()
# Dessiner la tige
for j in range(11):
    av()
# Dessiner la feuille
pdt(); av(); av(); av(); av(); phtd(); av(); av(); feuille()
st()
