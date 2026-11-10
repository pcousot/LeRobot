from LibRobot import *

# Dessiner le développement d'un tétraèdre tronqué
lgCote = 24

def faceEtCoin():
    # Hexagone
    pqtd(); lgRT(lgCote, 60); phtg()
    for i in range(6):
        av(); rt(60)
    # Triangle équilatéral
    pdt(); av(); pqtd(); av()

def developpementDuTetraedreTronque():
    for i in range(2):
        # Face et coin en bas
        faceEtCoin(); lc(); p3htd(); avf(2); phtg(); av()
        p3htd(); bc()
        # Face et coin en haut
        faceEtCoin(); lc(); av(); phtg(); avf(2); pqtg()
        bc()

developpementDuTetraedreTronque(); st()
