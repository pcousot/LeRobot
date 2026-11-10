from LibRobot import *

# Dessiner des cercles concentriques de diamètres 3,
# 6, ...
def cercle():
    lc(); av(); pqtg(); bc(); vg(); vg()
    vg(); vg(); lc(); pqtg(); av(); pdt(); bc()

def cerclesConcentriques():
    for i in range(1, 13):
        lg(3 * i); cercle()

cerclesConcentriques(); st()
