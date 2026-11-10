from LibRobot import *

# Dessiner une frise de rectangles troués
# Rejoindre le bord ouest
ag(); lc(); pqtd(); av(); pdt(); bc()
for u in range(6):
    # Dessiner un rectangle troué au nord
    av(); pqtg(); av(); av(); pqtg(); av(); av()
    av(); pqtg(); av(); av()
    pqtg(); av()
    # Traverser au sud-est
    lc(); p3htg(); av(); av(); p3htd(); bc()
    # Dessiner un rectangle troué au sud
    av(); pqtd(); av(); av(); pqtd(); av(); av()
    av(); pqtd(); av(); av()
    pqtd(); av()
    # Traverser au nord-est
    lc(); p3htd(); av(); av(); p3htg(); bc()
# Dessiner un rectangle troué au nord
av(); pqtg(); av(); av(); pqtg(); av(); av()
av(); pqtg(); av(); av()
pqtg(); av()
# Traverser au sud-est
lc(); p3htg(); av(); av(); p3htd(); bc()
# Dessiner un rectangle troué au sud
av(); pqtd(); av(); av(); pqtd(); av(); av()
av(); pqtd(); av(); av()
pqtd(); av(); st()
