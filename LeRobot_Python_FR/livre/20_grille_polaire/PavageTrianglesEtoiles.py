from LibRobot import *

# Pavage de triangles et d'étoiles
longueurCote = 15
nbLignes = 5
nbColonnes = 6

def croix():
    lgRT(longueurCote, 60)
    pne(); av(); p3htg(); avf(2); p3htg(); avf(2)
    p3htd(); avf(2); p3htd(); av()
    lgRT(longueurCote, 30)
    pne(); av(); p3htd(); avf(2); p3htd(); avf(2)
    p3htg(); avf(2); p3htg(); av()

def pavage():
    for j in range(1, nbColonnes + 1):
        for i in range(1, nbLignes + 1):
            lgRT(longueurCote, 60); eh()
            translater(0, -(2 * i))
            lgRT(longueurCote, 30); ag()
            translater(2 * j, 0)
            croix()

def coloriage():
    cc(bleu)
    for j in range(1, nbColonnes):
        for i in range(1, nbLignes):
            lgRT(longueurCote, 60); eh()
            translater(0, -(2 * i + 1))
            lgRT(longueurCote, 30); ag()
            translater(2 * j + 1, 0)
            peindre()

pavage(); coloriage(); st()
