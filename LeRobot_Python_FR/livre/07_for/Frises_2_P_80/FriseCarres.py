from LibRobot import *

# Dessiner une frise de carrés
def carre():
    for j in range(4):
        av(); pqtd()

def frise():
    for i in range(41):
        carre(); av()

ag(); pqtd(); frise(); st()
