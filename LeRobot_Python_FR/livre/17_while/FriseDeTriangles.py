from LibRobot import *

# Dessiner une frise de triangles d'un bord à l'autre

# Rejoindre le bord en avançant tout droit
def auBord():
    lc()
    while not tb():
        av()
    bc()

def motif():
    if not tb():
        av(); p3htg(); av(); p3htg(); av()
        if not tb():
            av(); p3htd(); av(); p3htd(); av()

def frise():
    pne()
    while not tb():
        motif()

pw(); auBord(); frise(); st()
