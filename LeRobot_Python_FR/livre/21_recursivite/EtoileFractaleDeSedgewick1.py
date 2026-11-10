from LibRobot import *

# Étoile fractale de Sedgewick

# Dessiner un carré centré en (x, y) de longueur de
# côté 2 * l
def carre(x, y, l):
    deplacer(x - l, y - l)
    for i in range(4):
        avf(2 * l); pqtd()

def etoile(x, y, l):
    if l > 0:
        etoile(x - l, y + l, l // 2)
        etoile(x + l, y + l, l // 2)
        etoile(x - l, y - l, l // 2)
        etoile(x + l, y - l, l // 2)
        carre(x, y, l)

lg(3); etoile(0, 0, 16)
st()
