from LibRobot import *

# Flocon ternaire
def arbre(l):
    if l > 1:
        tl(l // 3); rt(45)
        arbre(l // 3)
        rt(-45)
        arbre(l // 3)
        rt(-45)
        arbre(l // 3)
        rt(45); tl(-(l // 3))

def flocon(l):
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)
    arbre(l); rt(45)

flocon(162); flocon(54); st()
