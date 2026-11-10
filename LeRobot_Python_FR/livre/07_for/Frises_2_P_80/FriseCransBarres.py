from LibRobot import *

# Dessiner une frise de crans barrés
def motifDroit():
    av(); av(); pqtd(); av(); pqtg(); av(); pdt()
    av()
    av(); pdt(); av(); pqtd(); av(); pqtd(); av()
    av()

def motifGauche():
    av(); av(); pqtg(); av(); pqtg(); av(); pdt()
    av()
    av(); pdt(); av(); pqtd(); av(); pqtg(); av()
    av()

def frise():
    for i in range(10):
        motifDroit(); motifGauche()

ag(); frise(); st()
