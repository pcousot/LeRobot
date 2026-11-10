from LibRobot import *

# Pavage du plan avec des hexagones
lgLigne = 8
nbLignes = 9

def hexagone():
    for i in range(5):
        av(); rt(-60)
    av(); translater(2, 0); rt(-60)

def ligne(l):
    for c in range(lgLigne):
        hexagone()
    rt(-60)
    if l % 2 == 1:
        translater(-(2 * lgLigne) + 1, -1)
    else:
        translater(-(2 * lgLigne) - 1, -1)
    rt(60); translater(0, -1)

def pavage():
    for l in range(1, nbLignes + 1):
        ligne(l)

eh(); ag(); translater(0, -2); pavage(); st()
