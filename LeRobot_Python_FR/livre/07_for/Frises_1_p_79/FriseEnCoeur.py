from LibRobot import *

# Dessiner une frise en cœurs
ag()
for i in range(10):
    # Dessiner un motif composé d'un S miroir et d'un
    # S
    # S miroir de gauche
    vd(); vd(); vd(); vg(); vg(); vg()
    # Rejoindre le S miroir de droite
    lc(); av(); av(); pqtd(); av(); av(); pqtg()
    bc()
    # S de droite
    vg(); vg(); vg(); vd(); vd(); vd()
    # Rejoindre le début du motif suivant à droite
    lc(); av(); av(); pqtd(); av(); av(); pqtg()
    bc()
st()
