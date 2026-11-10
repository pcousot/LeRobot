from LibRobot import *

# Pavage rectangulaire à deux limites, inspiré d'un
# motif de N. J. van de Vecht

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
    lgY(1); eh(); lgY(11)
    for i in range(4):
        motif()
    pqtd(); avf(4); pqtg()

lgX(1); ag(); lgX(0)
for i in range(1, 8):
    colonne(); lgX(2 * i)
for i in range(1, 8):
    colonne(); lgX(14 - 2 * i)
colonne(); st()
