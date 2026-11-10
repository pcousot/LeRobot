from LibRobot import *

# Courbes de Hilbert d'ordres 1 à 6
def segmentG(n):
    if n > 0:
        pqtg()
        segmentD(n - 1)
        av()
        pqtd()
        segmentG(n - 1)
        av()
        segmentG(n - 1)
        pqtd()
        av()
        segmentD(n - 1)
        pqtg()

def segmentD(n):
    if n > 0:
        pqtd()
        segmentG(n - 1)
        av()
        pqtg()
        segmentD(n - 1)
        av()
        segmentD(n - 1)
        pqtg()
        av()
        segmentG(n - 1)
        pqtd()

def deuxPuissance(n):
    if n <= 0:
        return 1
    else:
        return 2 * deuxPuissance(n - 1)

for i in range(1, 7):
    message("Courbe de Hilbert d'ordre " + entierEnChaine(i))
    cf(blanc); eb(); ag()
    lg(256 // deuxPuissance(i)); segmentD(i)
    marquerUnePause()
st()
