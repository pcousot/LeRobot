from LibRobot import *

# Pavage irrégulier dans le style de M. C. Escher,
# inspiré d'un motif de N. J. van de Vecht.

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
# 8, 10, 8, 6, 4, 2, le robot partant en haut à gauche et
# arrivant en bas à droite (c'est-à-dire en bas à
# gauche de la colonne suivante) orienté vers le nord.
def colonne():
    lgY(1); eh()
    for i in range(1, 6):
        lgY(2 * i); motif()
    for i in range(1, 5):
        lgY(10 - 2 * i); motif()
    pqtd(); avf(4); pqtg()

# Dessiner un pavage irrégulier constitué de colonnes
# de largeurs 0, 2, 4, 6, ..., 14, 16, 14, ..., 2, 0.
def pavage():
    lgX(1); ag(); lgX(0)
    for i in range(1, 9):
        colonne(); lgX(2 * i)
    for i in range(1, 9):
        colonne(); lgX(16 - 2 * i)
    colonne()

pavage(); st()
