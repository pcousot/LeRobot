from LibRobot import *

# Dessiner une toile d'araignée
def hexagone(r):
    lgRT(r, 60)
    ce(); pw()
    for i in range(2):
        lc(); av(); av(); bc(); p3htd(); av(); phtd()
        av(); av(); phtd(); av(); ce()
        pe()

def diagonales(r):
    lgRT(r, 60)
    psw()
    for i in range(4):
        av(); ce(); pqtd()
    ce(); pw(); avf(2); ce(); pe(); avf(2)

def toile():
    for i in range(1, 9):
        hexagone(5 * i)
        diagonales(5 * i)

toile(); st()
