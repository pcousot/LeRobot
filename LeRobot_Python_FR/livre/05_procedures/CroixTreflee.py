from LibRobot import *

# Dessiner une croix tréflée

# Dessiner une branche terminée par un trèfle
def branche():
    av(); av(); av(); av()
    pqtd(); vg(); vg(); vd(); pdt(); vd(); vg(); vg()
    pqtd(); av(); av(); av(); av()

def croix():
    branche(); pqtd(); branche(); pqtd()
    branche(); pqtd(); branche(); pqtd()

croix(); st()
