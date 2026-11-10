from LibRobot import *

# Étapes de la peinture d'un dessin : dessiner le
# pourtour du Yin Yang et peindre la zone de droite
tailleQuadrillage = 24

lg(tailleQuadrillage)
# Demi cercle inférieur
pqtd(); vg(); vg()
# Demi cercle supérieur
vd(); vd()
# Cercle du pourtour
lg(2 * tailleQuadrillage)
vd(); vd(); vd(); vd()
# Peindre
pqtg(); peindre()
st()
