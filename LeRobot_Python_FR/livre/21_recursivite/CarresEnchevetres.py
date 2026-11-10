from LibRobot import *

# Carrés enchevêtrés
def carres(l):
    if l > 2:
        # Dessiner un carré de côté l en partant du centre
        lg(l / 2); lc(); av(); pqtd()
        bc(); av(); pqtd(); avf(2); pqtd(); avf(2); pqtd()
        avf(2); pqtd(); av(); pqtd()
        lc(); av(); pdt()
        # Imbriquer quatre carrés
        for i in range(4):
            lg(l / 3); lc(); av()
            carres(l / 3)
            lg(l / 3); lc(); avf(-1)
            pqtd()

carres(170); st()
