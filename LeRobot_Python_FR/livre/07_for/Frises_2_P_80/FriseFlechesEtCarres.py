from LibRobot import *

# Dessiner une frise de flèches et de carrés
def carre():
    for j in range(4):
        av(); pqtd()

def frise():
    phtd()
    for k in range(7):
        # Dessiner la flèche gauche
        av(); pdt(); av(); pqtg(); av(); pdt(); av()
        p3htd(); av(); av()
        phtg(); carre(); phtd()
        # Traverser le losange d'ouest en est
        lc(); av(); av(); bc()
        # Dessiner la flèche droite
        av(); av(); p3htg(); av(); pdt(); av(); pqtd()
        av(); pdt(); av()

ag(); frise(); st()
