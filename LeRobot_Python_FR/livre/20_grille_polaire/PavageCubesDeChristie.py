from LibRobot import *

# Pavage de cubes de A. H. Christie, 'Pattern design.
# An introduction to the study of formal ornament',
# Clarendon press, Oxford, 1929 ; réimpression Dover,
# New York, 1969.
longueurCote = 13
angle = 30
nbLignes = 7
nbColonnes = 7

def cube():
    pne(); av(); pqtd(); av(); pqtd(); av(); pqtd()
    av()
    ps(); avf(2); phtg(); av(); p3htg(); avf(2)
    phtd(); peindre(); pqtd(); cc(violet); peindre()
    cc(noir); phtd()
    avf(2); p3htg(); av(); phtg(); avf(2)

def pavage():
    lgRT(longueurCote, angle)
    eh()
    for i in range(1, nbLignes + 1):
        ag(); lc()
        if i % 2 == 1:
            ps(); avf(2); pse(); av()
        else:
            pse(); av(); ps(); av(); psw(); av()
        bc()
        for j in range(nbColonnes):
            cube()

pavage(); st()
