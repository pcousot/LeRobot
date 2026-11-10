from LibRobot import *

# Dessiner une frise crantée

# Dessiner le motif 'n_'
def cran():
    av(); pqtd(); av(); pqtd(); av(); pqtg(); av()
    pqtg()

ag()
for i in range(20):
    cran()
st()
