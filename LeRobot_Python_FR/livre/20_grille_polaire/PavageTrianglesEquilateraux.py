from LibRobot import *

# Pavage de triangles équilatéraux
longueurCote = 13
angle = 60
nbLignes = 12
nbColonnes = 12

def trianglePointeEnHaut():
    pn(); phtd(); av(); pqtd(); av(); p3htd(); avf(2)

def trianglePointeEnHautNoir():
    trianglePointeEnHaut(); phtg(); peindre()

def trianglePointeEnBas():
    ps(); phtg(); av(); pqtg(); av(); p3htg(); avf(2)

def trianglePointeEnBasNoir():
    trianglePointeEnBas(); avf(-1); pqtd(); peindre()

def pavage():
    lgRT(longueurCote, angle)
    for j in range(1, nbColonnes + 1):
        for i in range(1, nbLignes // 2 + 1):
            if (i + j) % 2 == 1:
                eh(); ag(); translater(2 * j, -(2 * i))
                trianglePointeEnHautNoir()
                eh(); ag(); translater(2 * j, -(2 * i))
                trianglePointeEnBas()
            else:
                eh(); ag(); translater(2 * j, -(2 * i))
                trianglePointeEnHaut()
                eh(); ag(); translater(2 * j, -(2 * i))
                trianglePointeEnBasNoir()

pavage(); st()
