from LibRobot import *

# Dessiner un micro-ordinateur

# Dessiner un rectangle de hauteur et largeur
# données, le robot partant et arrivant au coin
# inférieur gauche, orienté vers le nord.
def rectangle(hauteur, largeur):
    for i in range(2):
        avf(hauteur); pqtd(); avf(largeur); pqtd()

# Clavier
rectangle(1, 8)
# Boîtier
av(); pqtd(); av(); pqtg(); rectangle(3, 6)
avf(3); rectangle(5, 6)
# Écran
pqtd(); av(); pqtg(); lc(); av(); bc()
rectangle(3, 4)
# Logo représenté par une croix
pdt(); lc(); avf(3); bc(); dc()
# Lecteur de disquettes inférieur
pqtg(); lc(); av(); av(); bc(); avf(2)
# Lecteur de disquettes supérieur
pqtg(); lc(); av(); pqtg(); bc(); avf(2)
st()
