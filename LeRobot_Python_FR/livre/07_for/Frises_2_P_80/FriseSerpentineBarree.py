from LibRobot import *

# Dessiner une frise serpentine barrée
def motifHaut():
    vd(); pqtd(); av(); pdt(); av(); pqtd(); vd()

def motifBas():
    vg(); pqtg(); av(); pdt(); av(); pqtg(); vg()

def frise():
    for i in range(10):
        motifHaut(); motifBas()

ag(); frise(); st()
