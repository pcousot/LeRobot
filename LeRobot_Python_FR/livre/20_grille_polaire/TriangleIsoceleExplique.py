from LibRobot import *

# Figure expliquant le programme TriangleIsocele
longueurCote = 50
angle = 70

def pointille(n):
    for i in range(1, n + 1):
        if i % 2 == 1:
            lc()
        av()
        if i % 2 == 1:
            bc()

# Marquer l'angle et dessiner le carreau de x sur y
# pixels de la grille, en pointillés
def angleEtRepere(x, y):
    # Marquer l'angle
    lgRT(10, angle)
    pdt(); avf(2); pqtg(); vg()
    lc(); pdt(); avf(2)
    ecrire(entierEnChaine(angle) + "°"); bc()
    ce()
    # Dessiner le repère
    lg(2)
    pointille(x); pqtg(); pointille(y); pqtg()
    pointille(x); pqtg(); pointille(y); pqtg()

# Dessiner le triangle
lgRT(longueurCote, angle)
phtd(); av(); pqtd(); av(); p3htd(); avf(2)
angleEtRepere(round(valLgX() / 2), round(valLgY() / 2))
st()
