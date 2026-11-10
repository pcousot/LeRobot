from LibRobot import *

# Définir la commande pn du robot avec des tests et
# l'essayer dans les huit directions

# Faire pivoter le robot sur place vers le nord
def pn():
    if tne():
        phtg()
    elif te():
        pqtg()
    elif tse():
        p3htg()
    elif ts():
        pdt()
    elif tsw():
        p3htd()
    elif tw():
        pqtd()
    elif tnw():
        phtd()

for i in range(1, 9):
    ce(); pn()
    for j in range(i):
        phtd()
    av()
st()
