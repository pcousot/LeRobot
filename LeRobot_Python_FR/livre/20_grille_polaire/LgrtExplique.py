from LibRobot import *

# Figure expliquant la commande lgRT
r = 90
t = 30

def pointille(n):
    for i in range(1, n + 1):
        if i % 2 == 1:
            lc()
        av()
        if i % 2 == 1:
            bc()

# Marquer la diagonale, l'angle et le carreau de x sur
# y pixels de la grille
def marquer(x, y):
    # Marquer la diagonale avec R
    lc(); ce()
    lgRT(r / 2, t)
    pne(); av(); pw(); lg(12)
    avf(4)
    ecrire("R = " + entierEnChaine(r))
    # Marquer l'angle avec T
    lgRT(10, t)
    ce(); pe(); avf(2); pqtg(); bc(); vg()
    lc(); pdt(); avf(2)
    ecrire("T = " + entierEnChaine(t) + "°"); bc()
    ce()
    # Dessiner le repère
    ce(); pe(); lg(2)
    pointille(round(x / 2)); pqtg()
    pointille(round(y / 2))
    # Marquer le repère
    lc(); lgX(round(x / 2))
    lgY(round(y / 2))
    ce(); pe(); avf(2); pn(); av()
    ecrire(" Y = " + entierEnChaine(round(y)))
    ce(); pe(); av(); ps(); lg(12); av()
    ecrire("X = " + entierEnChaine(round(x)))
    # Mettre le robot dans la position initiale
    ce(); pn(); bc()

# Dessiner la diagonale
lgRT(r, t); dg()
pne(); av()
marquer(valLgX(), valLgY())
# Explication
message("lgRT (R, T) définit la même grille que lgX X; lgY Y")
marquerUnePause()
