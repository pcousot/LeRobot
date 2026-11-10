from LibRobot import *

# Dessiner une arabesque
def demiMotif():
    # Quart de motif
    phtg(); avf(2); phtd(); avf(2); phtg(); av()
    # Demi-carré central
    p3htd(); lc(); avf(2); pqtd(); bc(); av(); pqtg()
    av(); lc(); pqtg(); avf(2); pqtg()
    bc(); av(); pqtg(); av(); pqtd(); lc(); avf(2)
    p3htd(); bc()
    # Quart de motif
    av(); phtg(); avf(2); phtd(); avf(2); phtg()

def motif():
    demiMotif()
    vg(); pdt(); vg(); demiMotif()

def ovalCentral():
    ce(); lc(); pn(); av(); av(); bc(); pqtd()
    vd(); avf(2); vd(); vd(); avf(2); vd()

def quartMotifCentral():
    vd(); av(); pqtg(); vd(); pqtg(); vd(); pqtg()
    av(); vd()

ec(2)
# Motif extérieur
for j in range(4):
    lc(); ce(); pqtg(); avf(11); pqtd(); avf(6)
    pqtd(); bc()
    motif(); pdt(); motif()
# Motif central
for j in range(4):
    lc(); ce(); pqtd(); avf(5); pqtd(); bc()
    quartMotifCentral()
ovalCentral()
ce(); pqtg(); st()
