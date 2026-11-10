from LibRobot import *

# Dessiner une frise de doubles crans

# Dessiner le motif 'n_'
def cran():
    av(); pqtd(); av(); pqtd(); av(); pqtg(); av()
    pqtg()

def friseCrantee():
    for j in range(20):
        cran()

ag()
for i in range(2):
    friseCrantee()
    # Extrémité droite
    av(); pqtd(); av(); pqtd(); av(); av()
st()
