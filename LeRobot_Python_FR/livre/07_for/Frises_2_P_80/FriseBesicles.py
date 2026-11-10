from LibRobot import *

# Dessiner une frise de besicles
def besicles():
    av(); av(); pqtd(); av(); pqtd(); av(); pqtd()
    av(); av()
    pqtd(); av(); av(); av(); pqtd()
    av(); av(); pqtd(); av(); pqtd(); av(); pqtd()
    av(); av()

def frise():
    pqtd()
    for l in range(8):
        besicles()

ag(); frise(); st()
