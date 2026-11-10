from LibRobot import *

# Dessiner une frise de X penchés
ag()
for l in range(20):
    # Le robot étant tourné vers le nord, dessiner un
    # X penché
    # Branche NW-SE
    pqtd(); av(); phtd(); av(); av(); phtg(); av()
    # Revenir au centre du X
    pdt(); av(); phtd(); av()
    # Demi-branche SW
    pqtg(); av(); p3htg(); av()
    # Revenir au centre du X
    pdt(); av(); p3htd(); av()
    # Demi-branche NE
    av(); p3htg(); av()
    # Retourner le robot vers le nord
    pqtd()
st()
