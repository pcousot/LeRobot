from LibRobot import *

# Dessiner une frise de losanges se chevauchant
def losange():
    lgX(10); lgY(30)
    for j in range(4):
        av(); pqtd()

def frise():
    ag()
    # S'orienter au NE
    phtd()
    for k in range(48):
        losange()
        # Avancer au milieu du losange
        phtd(); lc(); av(); bc()
        # S'orienter au NE
        phtg()

frise(); st()
