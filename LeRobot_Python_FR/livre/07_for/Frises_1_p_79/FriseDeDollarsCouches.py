from LibRobot import *

# Dessiner une frise de dollars couchés
# Rejoindre l'extrémité droite de la frise
lc(); ad(); pqtg(); av(); av(); pqtd(); bc()
for i in range(10):
    # Dessiner un dollar couché
    # Arc de l'extrémité droite du $
    p3htg(); vg(); phtg()
    # Corps en S de $
    vg(); vg(); vg(); vd(); vd(); vd()
    # Arc de l'extrémité gauche du $
    phtd(); vd(); p3htd()
    # Rejoindre le $ de gauche
    lc(); pqtg(); av(); av(); pqtd(); bc()
st()
