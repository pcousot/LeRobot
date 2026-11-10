from LibRobot import *

# Pavage de triangles et de carrés
longueurCote = 15
nbLignes = 6
nbColonnes = 4

def trianglesNS():
    lgRT(longueurCote, 60)
    pn(); phtd(); av(); pqtd(); av(); p3htd(); avf(2)
    p3htg(); av(); pqtg(); av()

def trianglesWE():
    lgRT(longueurCote, 30)
    pne(); av(); pqtd(); av(); pqtd(); av(); pqtd()
    av(); pqtd(); av(); p3htd()
    avf(2); p3htg(); av()

def pavage():
    ce(); lg(12); eh()
    for i in range(1, nbLignes + 1):
        lgRT(longueurCote, 60); lc(); ag()
        if i % 2 == 1:
            lgRT(longueurCote, 30); ps(); av()
            lgRT(longueurCote, 60); av()
        else:
            lgRT(longueurCote, 30); pe(); av(); ps()
            av()
            lgRT(longueurCote, 60); psw(); av()
        bc()
        for j in range(nbColonnes):
            if i % 2 == 1:
                trianglesWE(); trianglesNS()
            else:
                trianglesNS(); trianglesWE()

def coloriage():
    ce(); lg(12); eh(); lc()
    for i in range(1, nbLignes):
        lgRT(longueurCote, 60); lc(); ag()
        if i % 2 == 1:
            lgRT(longueurCote, 30); ps(); av()
            lgRT(longueurCote, 60); av()
        else:
            lgRT(longueurCote, 30); pe(); av(); ps()
            av()
            lgRT(longueurCote, 60); psw(); av()
        for j in range(1, nbColonnes + 1):
            if i % 2 == 1:
                lgRT(longueurCote, 30); pe(); avf(2); pn()
                cc(jaune); peindre()
                if j != nbColonnes:
                    lgRT(longueurCote, 60); pe(); avf(2); pn()
                    cc(noir); peindre()
            else:
                lgRT(longueurCote, 60); pe(); avf(2); pn()
                cc(noir); peindre()
                if j != nbColonnes:
                    lgRT(longueurCote, 30); pe(); avf(2); pn()
                    cc(jaune); peindre()

pavage(); coloriage(); st()
