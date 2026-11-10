from LibRobot import *

# Courbes de Von Koch d'ordres 0 à 5
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        phtg()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        phtg()
        segment(n - 1)

def quatrePuissance(n):
    if n <= 0:
        return 1
    else:
        return 4 * quatrePuissance(n - 1)

def grille(i):
    lg(500 / quatrePuissance(i - 1))

for i in range(1, 7):
    cf(blanc); eb(); ag(); pe(); grille(i)
    segment(i - 1); marquerUnePause()
