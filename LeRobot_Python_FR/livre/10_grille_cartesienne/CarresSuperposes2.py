from LibRobot import *

# Dessiner des carrés superposés en agrandissant la
# grille
def carre():
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    pqtd()

eb(); ag()
for i in range(1, 15):
    lg(6 * i); carre()
st()
