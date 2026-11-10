from LibRobot import *

# Frise de S couchés
# Rejoindre le point de départ de la frise de S
# couchés
lc(); ag(); pqtd(); av(); av(); av(); pqtd()
bc()
for i in range(5):
    # S couché de gauche
    for j in range(2):
        vd(); vd(); vd(); phtd(); vd()
        lc(); p3htg(); av(); pqtg(); bc()
    lc(); pqtg(); av(); av(); av(); av(); pqtg()
    bc()
    # S miroir couché de droite
    for j in range(2):
        vg(); vg(); vg(); phtg(); vg()
        lc(); p3htd(); av(); pqtd(); bc()
    # Rejoindre le point de départ du couple suivant
    # de S couchés
    lc(); pqtd(); av(); av(); av(); av(); pqtd()
    bc()
st()
