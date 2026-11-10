from LibRobot import *

# Pavage rectangulaire peint à deux limites, inspiré
# d'un motif de N. J. van de Vecht

# Motif de N. J. van de Vecht, le robot partant en
# haut à gauche et arrivant en bas à gauche orienté
# vers le nord.
def motif():
    pqtd(); avf(4); pqtd(); avf(3); pqtd(); av(); pqtd()
    avf(3); pdt(); avf(3)
    av(); pqtd(); av(); pqtg(); av(); pqtg(); av()
    pqtd(); av(); pqtd(); avf(3)
    pqtd(); av(); pqtd(); av(); pqtg(); av(); pqtg()
    av(); pqtd(); av(); pqtd(); avf(3)
    pdt(); avf(3); pqtd(); avf(3); lc(); pdt(); avf(6)
    pdt(); bc()

def colonne():
    eh()
    for i in range(4):
        motif()
    pqtd(); avf(4); pqtg()

# Même motif, peint
def motifPeint():
    pqtd(); avf(4); pqtd(); avf(3); pqtd(); av(); pqtd()
    avf(3); pdt(); avf(3)
    phtd(); peindre(); phtg(); av(); pqtd(); av()
    pqtg(); av(); pqtg(); av()
    pqtd(); av()
    pqtd(); avf(3); pqtd(); av(); pqtd(); av(); pqtg()
    av(); pqtg(); av(); pqtd(); av()
    pqtd(); avf(3); pdt(); avf(3); phtd(); peindre()
    phtd(); avf(3); lc(); pdt()
    avf(6); pdt(); bc()

def colonnePeinte():
    eh()
    for i in range(4):
        motifPeint()
    pqtd(); avf(4); pqtg()

ag(); lgY(11)
lgX(0); colonne()
for i in range(1, 8):
    lgX(2 * i); colonnePeinte()
for i in range(1, 7):
    lgX(14 - 2 * i); colonnePeinte()
lgX(0); colonne(); st()
