from LibRobot import *

# Dessiner le symbole chinois du Yin Yang
tailleQuadrillage = 3

def cercle():
    vd(); vd(); vd(); vd()

# Demi cercle inférieur
lg(6 * tailleQuadrillage)
pqtd(); vg(); vg()
# Demi cercle supérieur
lg(6 * tailleQuadrillage)
vd(); vd()
# Cercle du pourtour
lg(12 * tailleQuadrillage)
cercle()
# Petit cercle blanc
lg(2 * tailleQuadrillage)
lc(); pqtd(); avf(2); pqtg(); bc(); cercle()
# Peindre la zone noire
lc(); pqtd(); avf(4); peindre()
# Petit cercle noir
avf(2); pqtg(); bc(); cercle(); pqtg(); peindre()
st()
