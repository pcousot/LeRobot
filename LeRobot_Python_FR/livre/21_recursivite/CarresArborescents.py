from LibRobot import *

# Carrés arborescents
def arbre(l):
    if l >= 1:
        p3htg(); avf(l); p3htd(); arbre(l // 2); phtd()
        avf(l); phtg()
        p3htd(); avf(l); p3htg(); arbre(l // 2); phtg()
        avf(l); phtd()

def carres(l):
    if l >= 1:
        for i in range(4):
            arbre(l); pqtd()
        carres(l // 2)

lg(1.2); carres(32); st()
