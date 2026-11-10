from LibRobot import *

# Dessiner une frise de losanges

# Dessiner une dent de scie /\
def dent():
    av(); av(); pqtd(); av(); av(); pqtg()

# Dessiner une frise en dents de scie /\/\/\/\...
def scie():
    for i in range(10):
        dent()

# Dessiner la frise de losanges
def frise():
    # Déplacement à gauche du cadre, orientation au NE
    ag(); phtd()
    # Dessiner la frise de losanges par moitiés
    for j in range(2):
        scie()
        # Dessiner l'extrémité
        phtg(); av(); av(); p3htg()

frise(); st()
