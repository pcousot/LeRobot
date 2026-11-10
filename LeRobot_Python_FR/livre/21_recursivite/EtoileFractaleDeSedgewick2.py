from LibRobot import *

# Étoile fractale de Sedgewick
aucun = 0
nW = 1
nE = 2
sE = 3
sW = 4

# Dessiner un carré centré en (x, y) de longueur de
# côté 2 * l et auquel il manque le coin cM
def carre(x, y, l, cM):
    deplacer(x - l, y)
    for i in range(nW, sW + 1):
        if i == cM:
            lc()
        avf(l); pqtd(); avf(l)
        bc()

def etoile(x, y, l, cM):
    if l > 0:
        if cM != nW:
            etoile(x - l, y + l, l // 2, sE)
        if cM != nE:
            etoile(x + l, y + l, l // 2, sW)
        if cM != sW:
            etoile(x - l, y - l, l // 2, nE)
        if cM != sE:
            etoile(x + l, y - l, l // 2, nW)
        carre(x, y, l, cM)

lg(3); etoile(0, 0, 16, aucun); st()
