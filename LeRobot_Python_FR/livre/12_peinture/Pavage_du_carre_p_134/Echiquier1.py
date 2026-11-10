from LibRobot import *

# Dessiner un échiquier 8 x 8

# Dessiner un carré blanc de côté 2 en partant du
# coin inférieur gauche et en arrivant au coin
# inférieur droit, le robot gardant son orientation
# (nord ou sud)
def carreBlanc():
    for i in range(4):
        avf(2); pqtd()
    pqtd(); avf(2); pqtg()

# Dessiner un carré noir de côté 2 en partant du
# coin inférieur gauche et en arrivant au coin
# inférieur droit, le robot gardant son orientation
# (nord ou sud)
def carreNoir():
    carreBlanc()
    # Mettre le robot dans le carré blanc et peindre
    # en noir
    lc(); phtg(); av(); peindre()
    # Retourner au coin inférieur droit
    pdt(); av(); p3htg(); bc()

avf(6)
for i in range(4):
    # Dessiner une ligne impaire de huit carrés
    # alternativement blancs et noirs
    for j in range(4):
        carreBlanc(); carreNoir()
    # Retourner le robot pour dessiner une ligne
    # paire de droite à gauche
    pdt()
    # Dessiner une ligne paire de huit carrés
    # alternativement blancs et noirs
    for j in range(4):
        carreBlanc(); carreNoir()
    # Descendre le robot pour dessiner une ligne
    # impaire de gauche à droite
    lc(); avf(4); pdt(); bc()
st()
