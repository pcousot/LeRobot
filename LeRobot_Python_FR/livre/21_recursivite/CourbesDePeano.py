from LibRobot import *

# Courbes de Peano
def segmentX(n):
    if n > 0:
        segmentX(n - 1)
        av()
        segmentY(n - 1)
        av()
        segmentX(n - 1)
        pqtd()
        av()
        pqtd()
        segmentY(n - 1)
        av()
        segmentX(n - 1)
        av()
        segmentY(n - 1)
        pqtg()
        av()
        pqtg()
        segmentX(n - 1)
        av()
        segmentY(n - 1)
        av()
        segmentX(n - 1)

def segmentY(n):
    if n > 0:
        segmentY(n - 1)
        av()
        segmentX(n - 1)
        av()
        segmentY(n - 1)
        pqtg()
        av()
        pqtg()
        segmentX(n - 1)
        av()
        segmentY(n - 1)
        av()
        segmentX(n - 1)
        pqtd()
        av()
        pqtd()
        segmentY(n - 1)
        av()
        segmentX(n - 1)
        av()
        segmentY(n - 1)

def quatrePuissance(n):
    if n <= 0:
        return 1
    else:
        return 4 * quatrePuissance(n - 1)

for i in range(1, 5):
    message("Courbe de Peano d'ordre " + entierEnChaine(i))
    cf(blanc); ag(); eb()
    lg(512 / quatrePuissance(i))
    segmentX(i)
    marquerUnePause()
st()
