from LibRobot import *

# Dessiner une croix dans un carré
r = 60  # Rayon des arcs de la croix.

def carre():
    for i in range(4):
        av(); pqtd()

lgRT(2 * r, 45)
carre()
lg(valLgX() - r); av(); pqtd()
for i in range(2):
    lg(r); vg(); p3htd()
    lgRT(2 * r, 45); lg(valLgX() - r); av()
    p3htd()
    lg(r); vg(); p3htd()
    lgRT(2 * r, 45); lg(valLgX() - r); av()
    lc(); phtd(); lg(r); av(); pqtd()
    lgRT(2 * r, 45)
    lg(valLgX() - r); av(); pqtd(); bc()
st()
