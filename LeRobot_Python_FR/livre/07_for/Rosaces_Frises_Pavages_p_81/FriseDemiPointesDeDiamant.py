from LibRobot import *

# Dessiner une frise de demi-pointes de diamant
def motifGauche():
    av(); av(); av(); p3htd(); av(); phtd(); av()
    av(); pqtd(); av(); pdt(); av(); pqtg()

def motifDroit():
    av(); av(); phtd(); av(); p3htd(); av(); av()
    av(); pqtd(); av(); pdt(); av(); pqtg()

def traitHorizontal():
    for i in range(2):
        for j in range(40):
            av()
        pdt()

ag()
for j in range(20):
    motifGauche(); motifDroit()
lc(); pdt(); av(); pqtd(); bc()
traitHorizontal()
lc(); pqtd(); av(); av(); av(); av(); pqtg()
bc(); traitHorizontal()
lc(); pqtd(); av(); pqtg(); bc()
traitHorizontal(); st()
