from LibRobot import *

# Dessiner une frise de vaguelettes
longueur = 15

ag()
for i in range(2 * longueur):
    if tn():
        vd(); pqtd()
    elif ts():
        vg(); pqtg()
    elif te():
        pqtd()
    else:
        pqtg()
    av()
st()
