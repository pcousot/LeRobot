from LibRobot import *

# Pavage régulier inspiré d'un motif de
# N. J. van de Vecht

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

ag(); lg(11); eh(); avf(-24); avf(24)
for i in range(11):
    colonne()
avf(24); st()
