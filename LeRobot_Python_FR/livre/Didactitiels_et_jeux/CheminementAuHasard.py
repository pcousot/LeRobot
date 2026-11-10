# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# *                                                     *
# *******************************************************
from LibRobot import *

r = 0

for i in range(1000):
    # Tirer au sort un nombre R compris entre 0 et 7
    r = abs(random()) % 8
    # Pivoter sur place de R quarts de tour à droite
    pivoter(r)
    # Tirer au sort un nombre R compris entre 1 et 5
    r = abs(random()) % 5 + 1
    # Avancer R fois dans la direction courante, sauf si le robot touche le bord
    while r != 0 and not tb():
        av()
        r -= 1
st()
