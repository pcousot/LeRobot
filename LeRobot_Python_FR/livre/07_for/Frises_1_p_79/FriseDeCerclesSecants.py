from LibRobot import *

# Dessiner une frise de cercles sécants
ag()
# Tracer une frise de cercles sécants
for i in range(40):
    # Tracer un cercle, en partant du point le plus à
    # l'ouest, avec le robot orienté au nord
    vd(); vd(); vd(); vd()
    # Déplacer le robot au centre du cercle, orienté
    # vers le nord
    lc(); pqtd(); av(); pqtg(); bc()
st()
