# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Alphabet (en lettres majuscules), page 8.           *
# *                                                     *
# *******************************************************
from LibRobot import *

def av5fois():
    # Avancer tout droit 5 fois avec le crayon levé
    lc(); av(); av(); av(); av(); av()

def l1():
    # Se placer au début de la première ligne
    eh(); ag(); ps(); av5fois(); pn()

def l2():
    # Se placer au début de la deuxième ligne
    eh(); ag(); ps(); av5fois(); av5fois(); pn()

def l3():
    # Se placer au début de la troisième ligne
    eh(); ag(); ps(); av5fois(); av5fois(); av5fois(); pn()

def l4():
    # Se placer au début de la quatrième ligne
    eh(); ag(); ps(); av5fois(); av5fois(); av5fois(); av5fois(); pn()

def a():
    # Dessiner la lettre A
    bc(); av(); av(); pqtd(); av(); av(); pdt(); av(); av(); pqtd(); av(); vd()
    vd(); av(); av(); av(); lc(); pqtg(); av(); pqtg()

def b():
    # Dessiner la lettre B
    bc(); av(); av(); av(); av(); pqtd(); av(); vd(); vd(); av(); pdt(); av()
    vd(); vd(); av(); pdt(); lc(); av(); av(); av(); pqtg()

def c():
    # Dessiner la lettre C
    lc(); pqtd(); av(); vg(); pdt(); bc(); vd(); vd(); av(); av(); vd(); vd()
    lc(); av(); av(); av(); pqtg(); av(); pqtg()

def d():
    # Dessiner la lettre D
    bc(); av(); av(); av(); av(); pqtd(); av(); vd(); av(); av(); vd(); av()
    lc(); pdt(); av(); av(); av(); pqtg()

def e():
    # Dessiner la lettre E
    bc(); pqtd(); av(); av(); pdt(); av(); av(); pqtd(); av(); av(); pqtd(); av()
    pdt(); av(); pqtd(); av(); av(); pqtd(); av()
    av(); lc(); pqtd(); av(); av(); av(); av(); pqtg(); av(); pqtg()

def f():
    # Dessiner la lettre F
    bc(); av(); av(); pqtd(); av(); pdt(); av(); pqtd(); av(); av(); pqtd(); av()
    av(); lc(); pqtd(); av(); av(); av(); vg(); pqtg()

def g():
    # Dessiner la lettre G
    lc(); av(); av(); pqtd(); av(); bc(); av(); pqtd(); av(); vd(); vd(); av()
    av(); vd(); vd(); lc(); av(); av(); vg(); pqtg()

def h():
    # Dessiner la lettre H
    bc(); av(); av(); pqtd(); av(); av(); pdt(); av(); av(); pqtd(); av(); av()
    lc(); pqtd(); av(); av(); pqtd(); bc(); av(); av(); av(); av(); lc(); pqtg()
    av(); pqtg()

def i():
    # Dessiner la lettre I
    bc(); pqtd(); av(); av(); pdt(); av(); pqtd(); av(); av(); av(); av(); pqtg()
    av(); pdt(); av(); av(); lc(); pqtd(); av(); av(); av(); vg(); pqtg()

def j():
    # Dessiner la lettre J
    lc(); av(); av(); av(); av(); pqtd(); bc(); av(); av(); pqtd(); av(); av()
    av(); vd(); vd(); lc(); pdt(); vg(); av(); av(); pqtg()

def k():
    # Dessiner la lettre K
    bc(); av(); av(); av(); av(); pdt(); av(); av(); pqtg(); vg(); vd(); pdt()
    vg(); vd(); pdt(); vd(); vg(); lc(); av(); pqtg()

def l():
    # Dessiner la lettre L
    bc(); av(); av(); av(); av(); pdt(); av(); av(); av(); av(); pqtg(); av()
    av(); lc(); av(); pqtg()

def m():
    # Dessiner la lettre M
    bc(); av(); av(); av(); av(); pdt(); vg(); vg(); pdt(); av(); av(); av()
    av(); lc(); pqtg(); av(); pqtg()

def n():
    # Dessiner la lettre N
    bc(); av(); av(); av(); av(); pqtd(); vd(); vg(); pqtg(); av(); av(); pdt()
    av(); av(); av(); av(); lc(); pqtg(); av(); pqtg()

def o():
    # Dessiner la lettre O
    lc(); pqtd(); av(); pdt(); bc(); vd(); av(); av(); vd(); vd(); av(); av()
    vd(); lc(); pdt(); av(); av(); pqtg()

def p():
    # Dessiner la lettre P
    bc(); av(); av(); av(); av(); pqtd(); av(); vd(); vd(); av(); lc(); pdt()
    av(); av(); av(); pqtd(); av(); av(); pdt()

def q():
    # Dessiner la lettre Q
    lc(); pqtd(); av(); pqtg(); av(); pdt(); bc(); vg(); pdt(); lc(); av(); bc()
    vd(); av(); av(); vd(); vd(); av(); av(); vd(); lc(); pdt(); av(); av()
    pqtg()

def r():
    # Dessiner la lettre R
    bc(); av(); av(); av(); av(); pqtd(); av(); vd(); vd(); av(); pdt(); av()
    vd(); av(); lc(); pqtg(); av(); pqtg()

def s():
    # Dessiner la lettre S
    lc(); av(); pdt(); bc(); vg(); vg(); vg(); vd(); vd(); vd(); lc(); av()
    av(); vg(); pqtg()

def t():
    # Dessiner la lettre T
    lc(); pqtd(); av(); pqtg(); bc(); av(); av(); av(); av(); pqtg(); av(); pdt()
    av(); av(); lc(); pqtd(); av(); av(); av(); vg(); pqtg()

def u():
    # Dessiner la lettre U
    lc(); av(); bc(); av(); av(); av(); pdt(); av(); av(); av(); vg(); vg()
    av(); av(); av(); lc(); pdt(); av(); av(); av(); vg(); pqtg()

def v():
    # Dessiner la lettre V
    lc(); av(); bc(); av(); av(); av(); pdt(); av(); av(); av(); pqtg(); vd()
    pdt(); vd(); pqtg(); av(); av(); av(); pdt(); av(); av(); av(); lc(); vg()
    pqtg()

def w():
    # Dessiner la lettre W
    bc(); av(); av(); av(); av(); pdt(); av(); av(); av(); av(); pqtg(); vg()
    av(); av(); pdt(); av(); av(); vg(); pqtg(); av(); av(); av()
    av(); pdt(); av(); av(); av(); av(); lc(); pqtg(); av(); pqtg()

def x():
    # Dessiner la lettre X
    bc(); av(); vd(); vg(); av(); lc(); pqtg(); av(); av(); pqtg(); bc(); av()
    vg(); vd(); av(); lc(); pqtg(); av(); pqtg()

def y():
    # Dessiner la lettre Y
    lc(); av(); pdt(); bc(); vg(); vg(); av(); av(); av(); pdt(); av(); vd()
    vd(); av(); lc(); pqtd(); av(); av(); av(); pqtd(); av(); av(); av(); av()
    pdt()

def z():
    # Dessiner la lettre Z
    bc(); pqtd(); av(); av(); pdt(); av(); av(); pqtd(); av(); vd(); vg(); av()
    pqtg(); av(); av(); lc(); pdt(); av(); av(); pqtd(); av(); av(); av(); vg()
    pqtg()

# Alphabet
l1(); a(); b(); c(); d(); e(); f(); g()
l2(); h(); i(); j(); k(); l(); m(); n()
l3(); o(); p(); q(); r(); s(); t(); u()
l4(); v(); w(); x(); y(); z()
st()
# Alphabet
