from LibRobot import *

# Dessiner un pavage de carrés aux coins arrondis

# Dessiner une rangée de pavés
def rangee():
    for i in range(20):
        # Dessiner un pavé
        bc()
        for j in range(4):
            # Dessiner un coté du pavé
            av(); vd()
        # Rejoindre le début du pavé suivant
        lc(); pqtd(); av(); av(); pqtg()

# Rejoindre le début de la rangée suivante de pavés
def retour():
    pdt(); av(); pqtd()
    for i in range(40):
        av()
    pqtg(); av(); pdt()

# Dessiner 10 rangées de pavés
def pavage():
    for i in range(10):
        rangee(); retour()

# Placer le robot en haut à gauche de l'écran
eh(); ag(); lc(); pdt(); av(); av(); pdt()
bc(); pavage(); st()
