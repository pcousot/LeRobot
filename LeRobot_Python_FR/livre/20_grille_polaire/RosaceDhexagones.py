from LibRobot import *

# Dessiner une rosace d'hexagones
l = 30  # Longueur d'un segment

def hexagone():
    tl(l)
    for i in range(6):
        rt(60); av()

def rosace():
    for i in range(12):
        hexagone(); rt(30)

rosace(); st()
