# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Chiffres digitaux, page 8.                          *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner les chiffres 0 à 9, le robot partant en bas à
# gauche  du  chiffre et terminant dans la même position
# pour le chiffre suivant :
def c0():
    # Dessiner le chiffre 0
    bc(); av(); av(); pqtd(); av(); pqtd(); av(); av(); pqtd(); av()
    lc(); pdt(); av(); av(); pqtg()

def c1():
    # Dessiner le chiffre 1
    bc(); av(); av(); lc(); pqtd(); av(); pqtd(); av(); av(); pdt()

def c2():
    # Dessiner le chiffre 2
    lc(); av(); av(); pqtd(); bc(); av(); pqtd(); av(); pqtd(); av(); pqtg()
    av()
    pqtg(); av(); lc(); av(); pqtg()

def c3():
    # Dessiner le chiffre 3
    lc(); av(); av(); pqtd(); bc(); av(); pqtd(); av(); pqtd(); av(); pdt(); av()
    pqtd(); av(); pqtd(); av(); lc(); pdt(); av(); av(); pqtg()

def c4():
    # Dessiner le chiffre 4
    lc(); av(); av(); pdt(); bc(); av(); pqtg(); av(); pqtg(); av(); pdt(); av()
    av()
    lc(); pqtg(); av(); pqtg()

def c5():
    # Dessiner le chiffre 5
    bc(); pqtd(); av(); pqtg(); av(); pqtg(); av(); pqtd(); av(); pqtd(); av()
    lc(); av(); pqtd(); av(); av(); pdt()

def c6():
    # Dessiner le chiffre 6
    bc(); av(); pqtd(); av(); pqtd(); av(); pqtd(); av(); pqtd(); av(); av()
    pqtd()
    av(); lc(); av(); pqtd(); av(); av(); pdt()

def c7():
    # Dessiner le chiffre 7
    lc(); av(); av(); pqtd(); bc(); av(); pqtd(); av(); av(); pqtd()
    lc(); pdt(); av(); pqtg()

def c8():
    # Dessiner le chiffre 8
    bc(); av(); pqtd(); av(); pdt(); av(); pqtd(); av(); pqtd(); av(); pqtd()
    av()
    av(); pqtd(); av(); lc(); pdt(); av(); av(); pqtg()

def c9():
    # Dessiner le chiffre 9
    lc(); av(); bc(); pqtd(); av(); pdt(); av(); pqtd(); av(); pqtd(); av()
    pqtd()
    av(); av(); pqtd(); av(); lc(); pdt(); av(); av(); pqtg()

# ChiffresMontreDigitale
ag(); c0(); c1(); c2(); c3(); c4(); c5(); c6(); c7(); c8(); c9()
st()
# ChiffresMontreDigitale
