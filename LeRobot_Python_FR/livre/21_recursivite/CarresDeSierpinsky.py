from LibRobot import *

# Carrés de Sierpinski d'ordres 1 à 4
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        lc(); segment(n - 1); bc()
        segment(n - 1)

def carre(n):
    for i in range(4):
        segment(n); pqtd()

def troisPuissance(n):
    if n <= 0:
        return 1
    else:
        return 3 * troisPuissance(n - 1)

for i in range(1, 5):
    cf(blanc); ag(); eb()
    lg(162 // troisPuissance(i)); carre(i)
    marquerUnePause()
