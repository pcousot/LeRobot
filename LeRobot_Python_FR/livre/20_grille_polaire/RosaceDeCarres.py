from LibRobot import *

# Dessiner une rosace de carrés
l = 30  # Longueur d'un segment

def carre():
    tl(l); rt(90); av(); rt(90); av(); rt(90); av()
    rt(90); av()

def rosace():
    for i in range(6):
        rt(30); tl(l); rt(30); carre()

rosace(); st()
