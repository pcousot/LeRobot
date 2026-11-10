from LibRobot import *

# Dessiner une étoile à 6 branches
tailleQuadrillage = 20

def etoile():
    phtd()
    for i in range(6):
        av(); rt(60); av(); rt(240)

lg(tailleQuadrillage); etoile(); st()
