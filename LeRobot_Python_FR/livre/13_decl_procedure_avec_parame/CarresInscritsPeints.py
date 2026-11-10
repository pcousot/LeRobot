from LibRobot import *

# Motif de carrés inscrits de Horemis

# Dessiner un carré de côté m, incliné à 45 degrés,
# autour du carré précédent
def carre(m):
    phtd(); avf(m // 2)
    for j in range(4):
        pqtd(); avf(m)

# Dessiner un carré de côté m et peindre les quatre
# triangles compris entre ce carré et le précédent
def carrePeint(m):
    carre(m); lc()
    for j in range(4):
        phtg(); peindre(); p3htd(); avf(m)
    bc()

lg(5)
carre(1); carrePeint(2); carre(2); carrePeint(4)
carre(4); carrePeint(8); carre(8); carrePeint(16)
carre(16); carrePeint(32)
st()
