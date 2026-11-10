from LibRobot import *

# Dessiner un polygone régulier
tailleQuadrillage = 30
nombreDeCotes = 7

# Dessiner un polygone régulier de n >= 1 côtés
def polygone(n):
    for i in range(n):
        av(); rt(360 / n)

lg(tailleQuadrillage); polygone(nombreDeCotes); st()
