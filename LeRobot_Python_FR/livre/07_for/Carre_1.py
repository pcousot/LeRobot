from LibRobot import *

# Dessiner un carré avec des procédures

# Dessiner un côté du carré et pivoter à droite
def cote():
    for j in range(4):
        av()
    pqtd()

# Dessiner un carré
def carre():
    for i in range(4):
        cote()

carre(); st()
