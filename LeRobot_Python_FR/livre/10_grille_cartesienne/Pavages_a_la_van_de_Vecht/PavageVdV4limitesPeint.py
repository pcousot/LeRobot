from LibRobot import *

# Pavage irrégulier peint dans le style de
# M. C. Escher, inspiré d'un motif de
# N. J. van de Vecht.

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

# Dessiner une colonne de motifs de hauteurs 2, 4, 6,
# 8, 6, 4, 2, le robot partant en haut à gauche et
# arrivant en bas à droite (c'est-à-dire en bas à
# gauche de la colonne suivante) orienté vers le nord.
def colonne():
    lgY(1); eh()
    for i in range(1, 5):
        lgY(2 * i); motif()
    for i in range(1, 4):
        lgY(8 - 2 * i); motif()
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
    lgY(1); eh()
    for i in range(1, 5):
        lgY(2 * i); motifPeint()
    for i in range(1, 4):
        lgY(8 - 2 * i); motifPeint()
    pqtd(); avf(4); pqtg()

lgX(1); ag()
# Dessiner un pavage irrégulier constitué de
# colonnes de largeurs 0, 2, 4, 6, ..., 10, 12, 10,
# ..., 2, 0.
lgX(0); colonne()
for i in range(1, 7):
    lgX(2 * i); colonnePeinte()
for i in range(1, 6):
    lgX(12 - 2 * i); colonnePeinte()
lgX(0); colonne(); st()
