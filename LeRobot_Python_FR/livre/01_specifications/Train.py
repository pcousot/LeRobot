# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Moyens de transport, page 10.                       *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner un train à vapeur avec tandem et deux wagons de voyageurs
def roue():
    vg(); vg(); vg(); vg()

def locomotive():
    # Avant
    avf(2); pqtg(); avf(3); pqtg(); av(); pqtg(); avf(3); pqtg(); av(); pqtd()
    av()
    pdt()
    avf(5)
    # Corps
    pqtd(); av(); pqtg(); avf(2); pqtd(); av(); pqtd(); avf(2); pqtd(); av()
    pdt()
    avf(11)
    pqtd(); avf(5); pqtd(); avf(6); roue(); avf(3); roue(); avf(3); pdt()
    avf(12)
    # Cabine
    pqtg(); avf(8); pqtd(); av()
    # Fenêtre
    pqtd(); lc(); av(); bc(); avf(3); pqtg(); avf(2); pqtg(); avf(2); phtg()
    av()
    phtg()
    av(); pqtd(); lc(); av(); bc(); pqtd()
    avf(2); phtd(); avf(3); phtd(); av(); pqtg(); av(); pqtd(); avf(4); pqtd()
    avf(2)
    roue(); avf(3); roue(); avf(2); pdt(); avf(7); pqtg(); av(); pqtd(); av()

def tander():
    av(); pqtg(); avf(3); pqtd(); avf(2); phtg(); avf(2); phtd(); avf(5); pqtd()
    avf(6)
    pqtd(); avf(2); roue(); avf(5); roue(); avf(2); pqtd(); av(); pqtd(); lc()
    avf(9)
    bc()
    av()

def fenetre():
    pqtd(); lc(); av(); bc(); avf(3); pqtg(); avf(2); pqtg(); avf(3); pqtg()
    avf(2)
    lc()
    pqtd(); av(); pqtd(); bc()

def porte():
    pqtd(); lc(); av(); bc(); avf(4); lc(); pqtg(); av(); dc(); pdt(); av()
    pqtg()
    bc(); avf(3)
    pqtg(); avf(3); pqtg(); avf(7); pqtg(); avf(3); lc(); pqtd(); av(); pqtd()
    bc()

def wagon():
    av(); av(); pqtd(); av(); pdt(); avf(8); pqtg(); av(); pdt(); avf(2)
    fenetre()
    avf(3)
    fenetre(); avf(3); porte(); avf(4); fenetre(); avf(3); fenetre(); avf(4)
    pdt()
    av(); pqtg(); avf(8); pqtd(); avf(3); roue(); avf(11); roue(); avf(3); pdt()
    avf(17); pqtg(); av(); pqtd(); av()

lg(6); ag(); pqtd(); locomotive(); tander(); wagon(); wagon(); st()
