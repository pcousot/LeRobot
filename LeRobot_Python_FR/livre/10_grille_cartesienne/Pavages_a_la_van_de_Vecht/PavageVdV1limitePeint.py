from LibRobot import *

# Pavage rectangulaire peint à une limite, inspiré
# d'un motif de N. J. van de Vecht

# Motif de N. J. van de Vecht, le robot partant en
# haut à gauche et arrivant en bas à gauche orienté
# vers le nord.
def motif():
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

def colonne():
    eh()
    for i in range(4):
        motif()
    pqtd(); avf(4); pqtg()

ag(); lgY(11); lgX(22)
for i in range(1, 10):
    colonne(); lgX(22 - 2 * i)
st()
