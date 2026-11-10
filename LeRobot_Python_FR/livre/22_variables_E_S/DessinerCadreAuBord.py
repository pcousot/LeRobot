from LibRobot import *

# Dessiner un cadre autour de la fenêtre

# Gagner rapidement le bord de la fenêtre
def auBord():
    i = 4096
    while i >= 1:
        lg(i)
        while not tb():
            av()
        i = i // 2

def rejoindreCoinNE():
    lc(); pn(); auBord(); pe(); auBord(); bc()

def dessinerCadre():
    for i in range(4):
        pqtd(); auBord()

rejoindreCoinNE(); dessinerCadre(); ce(); st()
