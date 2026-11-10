from LibRobot import *

# Dessiner le développement d'un octaèdre régulier
cote = 25

def triangle():
    lgRT(cote, 60); phtd(); av(); pqtd(); av()
    p3htd(); av(); av()
    pdt(); av(); av(); pqtg()

# Triangle en bas à gauche
pdt(); triangle(); pdt()
# Rangée de trois triangles pointes en haut
for i in range(3):
    triangle()
# Compléter les trois triangles pointes en bas
phtd(); av(); p3htg(); avf(6)
# Triangle en haut à droite
pdt(); avf(4); pqtg(); triangle()
st()
