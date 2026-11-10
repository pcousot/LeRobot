from LibRobot import *

# Dessiner une frise crénelée

# Le robot étant orienté à l'est, dessiner un motif
# créné
def motifCrene():
    av(); pqtd(); av(); av(); pqtg(); av(); pqtd()
    vg()
    vg(); pqtd(); av(); pqtg(); av(); av(); pqtd()
    av()

# Le robot étant orienté au nord, dessiner une frise
# de 7 motifs crénés
def frise():
    pqtd()
    for i in range(7):
        motifCrene()

ag(); frise(); st()
