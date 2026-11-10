# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Moyens de transport, page 10.                       *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner un péniche
tailleCarreauGrille = 11
nombreDeHublots = 8

def porte():
    # Dessiner la porte de la cabine en partant et en terminant au coin
    # inférieur droit, robot orienté vers l'ouest
    pqtd(); avf(6); pqtg(); avf(3); pqtg(); avf(3); lc(); pqtg(); av(); dc()
    pdt()
    av(); pqtg()
    bc(); avf(3); pqtg(); avf(3); pdt()

def fenetre():
    # Dessiner la fenêtre de la cabine en partant et en terminant du point
    # du  toit  au  dessus  du  coin supérieur gauche de la fenêtre, robot
    # orienté vers l'est
    pqtd(); lc(); av(); bc(); avf(3); pqtg(); avf(2); pqtg(); avf(3); pqtg()
    avf(2)
    lc()
    pqtd(); av(); pqtd(); bc()

def cabine():
    # Dessiner la cabine en partant du coin inférieur droit, robot orienté
    # vers  l'ouest  et  en  terminant  avec le robot vers l'ouest au coin
    # inférieur gauche
    av(); porte(); avf(7); pqtd(); avf(8); pqtg(); avf(2); pdt(); avf(3)
    fenetre()
    avf(7); pqtd(); avf(8); pqtd(); avf(8)

def hublot():
    lc(); pqtd(); av(); bc(); pqtd(); vg(); vg(); vg(); vg(); lc(); pqtd(); av()
    pqtd(); bc()

def dessus(n):
    # Dessus de la péniche avec N hublots
    avf(3 * n + 4); pqtd(); avf(3); vd()
    for h in range(n):
        avf(2); hublot(); av()
    vd(); avf(3); pqtd(); avf(3 * n + 5)

def coque(n):
    # Dessiner la coque d'une péniche de N hublots, en partant du coin
    # supérieur gauche
    pqtd(); av(); pdt(); avf(6); vg(); avf(3 * n + 16); vg(); avf(6)

lg(tailleCarreauGrille); ad(); lc(); pqtg(); av(); bc(); avf(3)
cabine()
dessus(nombreDeHublots); coque(nombreDeHublots); st()
