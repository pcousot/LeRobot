from LibRobot import *

# Dessiner un logo en couleur
def petitMotifInterieur(c):
    cc(c); ec(1)
    av(); phtd(); avf(2); phtg(); vg(); vd(); pdt()
    vd(); vg(); phtg(); avf(2); phtd(); av()

def grandMotifInterieur(c):
    cc(c); ec(3)
    lc(); av(); bc(); avf(3); vd(); vg(); phtg()
    avf(2); pqtg(); avf(2); phtg(); vg(); vd(); avf(3)
    lc(); av(); bc()

def cadreInterieur():
    cc(jaune); ec(3)
    lc(); phtg(); avf(6); p3htd(); bc()
    for i in range(4):
        avf(3); lc(); avf(6); bc(); avf(3); pqtd()

def cadreIntermediaire():
    cc(indigo); ec(5)
    lc(); p3htg(); av(); p3htd(); bc()
    for i in range(4):
        avf(4); phtg(); avf(3); pqtd(); avf(3); phtg()
        avf(4); pqtd()

def cadreExterieur():
    cc(rouge); ec(7)
    lc(); p3htg(); avf(2); p3htd(); bc()
    for i in range(4):
        avf(6); lc(); avf(6); bc(); avf(6); pqtd()

lg(8); ce()
grandMotifInterieur(vert); phtd()
petitMotifInterieur(noir); phtd()
grandMotifInterieur(noir); phtd()
petitMotifInterieur(violet); phtd()
grandMotifInterieur(violet); phtd()
petitMotifInterieur(bleu); phtd()
grandMotifInterieur(bleu); phtd()
petitMotifInterieur(vert); phtd()
cadreInterieur(); cadreIntermediaire()
cadreExterieur()
ce(); pqtg(); st()
