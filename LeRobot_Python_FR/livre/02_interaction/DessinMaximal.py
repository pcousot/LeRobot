# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Trajectoiures du Robot, page 15.                    *
# *                                                     *
# *******************************************************
from LibRobot import *

def enHaut():
    lg(1); eh(); lg(51)

def aGauche():
    lg(1); ag(); lg(51)

def aLaLigne():
    lc(); aGauche(); ps(); av(); pe(); bc()

def croix():
    for i in range(8):
        phtd()
        av(); pdt(); av(); pdt()
        vg(); pdt(); vd(); pdt()
        vd(); pdt(); vg(); pdt()

enHaut(); aGauche()
for l in range(4):
    aLaLigne()
    for c in range(8):
        av(); croix()
st()
