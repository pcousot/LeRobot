from LibRobot import *

# Dessiner une frise de carrés imbriqués
def carre():
    for j in range(4):
        av(); pqtd()

def frise():
    # S'orienter au NE
    phtd()
    for k in range(41):
        carre()
        # Avancer au milieu du carré
        lc(); phtd(); av(); bc()
        # S'orienter au NE
        phtg()

ag(); frise(); st()
