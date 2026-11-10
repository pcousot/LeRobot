from LibRobot import *

# Figure expliquant la commande rt : le carreau de la
# grille après des rotations successives de 15 degrés
longueurCote = 30
n = 24
dx = 70
dy = 40
nbH = 5
bordX = 40
plusY = 10

def pointille(n):
    lc()
    for i in range(1, n + 1):
        if i % 2 == 1:
            dp()
        av()
    dp(); bc()

# Placer le robot à la position du i-ème schéma
def position(i):
    lg(1); eh(); ag(); translater(bordX, 0)
    translater(dx * (i % nbH), -(dy * (i // nbH + 1)))
    if i // nbH == 2:
        translater(0, plusY)
    if i // nbH == 4:
        translater(0, -plusY)

# Dessiner le carreau (0, 0) - (1, 1) de x sur y pixels
# dans le i-ème schéma, puis y placer le robot à
# l'extrémité du segment, dans l'orientation o
def carreau(i, x, y, o):
    position(i); lg(1); pe()
    pointille(round(x)); pqtg()
    pointille(round(y)); pqtg()
    pointille(round(x)); pqtg()
    pointille(round(y)); pqtg()
    lgX(x); lgY(y)
    if o == 0:
        pn(); deplacer(0, 1)
    elif o == 1:
        pne(); deplacer(1, 1)
    elif o == 2:
        pe(); deplacer(1, 0)
    elif o == 3:
        pse(); deplacer(1, -1)
    elif o == 4:
        ps(); deplacer(0, -1)
    elif o == 5:
        psw(); deplacer(-1, -1)
    elif o == 6:
        pw(); deplacer(-1, 0)
    else:
        pnw(); deplacer(-1, 1)

def repere(i):
    carreau(i, valLgX(), valLgY(), valOrientation())

message("lg 30.; pe (); av ()")
position(0); lg(longueurCote); pe(); av(); repere(0)
for i in range(1, n + 1):
    message("lg 30.; pe (); rt " + entierEnChaine(i * (360 // n)) + ".; av ()")
    position(i); lg(longueurCote); pe()
    rt(i * (360 // n))
    av(); repere(i)
st()
