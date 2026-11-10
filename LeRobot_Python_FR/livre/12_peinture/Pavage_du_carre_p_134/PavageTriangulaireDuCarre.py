from LibRobot import *

# Pavage triangulaire du carré
tailleGrille = 24

lg(tailleGrille)
for i in range(4):
    # Petit triangle noir
    av(); pqtd(); av(); p3htd(); av(); p3htd()
    lc(); av(); phtg(); peindre(); p3htg(); av()
    pdt(); bc()
    # Grand triangle blanc
    avf(2); pqtd(); avf(2); p3htd(); avf(2)
    # Petit triangle blanc
    av(); p3htd(); av(); pqtd(); av(); p3htd()
    # Grand triangle, extrémité noire
    avf(2); p3htd(); avf(2); pqtd(); avf(2); p3htd()
    lc(); av(); pqtg(); peindre(); pqtg(); av()
    pdt(); bc(); phtd()
st()
