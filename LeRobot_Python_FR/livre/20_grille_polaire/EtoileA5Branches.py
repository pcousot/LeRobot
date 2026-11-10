from LibRobot import *

# Dessiner une étoile à 5 branches
tailleQuadrillage = 60

def etoile():
    phtg()
    for i in range(5):
        av(); rt(144)

lg(tailleQuadrillage); etoile(); st()
