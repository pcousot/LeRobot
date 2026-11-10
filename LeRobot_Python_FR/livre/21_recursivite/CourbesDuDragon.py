from LibRobot import *

# Courbes du dragon d'ordres 1, 2, 4, ..., 12
def segmentDroit(n):
    if n == 0:
        av()
    elif n > 0:
        segmentDroit(n - 1)
        pqtg()
        segmentGauche(n - 1)

def segmentGauche(n):
    if n == 0:
        av()
    elif n > 0:
        segmentDroit(n - 1)
        pqtd()
        segmentGauche(n - 1)

def grille(i):
    message("Courbe du dragon d'ordre " + entierEnChaine(i))
    if i <= 6:
        lg(12)
    elif i <= 8:
        lg(6)
    elif i <= 10:
        lg(3)
    else:
        lg(2)

pe(); grille(1); segmentDroit(1); marquerUnePause()
for i in range(1, 7):
    cf(blanc); pe(); grille(2 * i); segmentDroit(2 * i)
    marquerUnePause()
st()
