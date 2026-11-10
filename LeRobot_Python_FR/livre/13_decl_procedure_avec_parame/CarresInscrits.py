from LibRobot import *

# Carrés inscrits les uns dans les autres

# Dessiner un carré de côté m, incliné à 45 degrés,
# autour du carré précédent
def carre(m):
    phtd(); avf(m // 2)
    for j in range(4):
        pqtd(); avf(m)

lg(5)
carre(1); carre(2); carre(2); carre(4); carre(4)
carre(8); carre(8); carre(16); carre(16); carre(32)
st()
