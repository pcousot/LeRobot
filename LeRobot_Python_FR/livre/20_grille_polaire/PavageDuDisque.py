from LibRobot import *

# Pavage à la Escher du disque
nc = 8  # Nombre de cercles concentriques
nr = 18  # Nombre de rayons sur 180 degrés (diviseur de 180)
dc = 10  # Distance entre deux cercles, comptée en pixels

lg(dc * nc)
# Tracer les rayons
for i in range(2 * nr):
    ce(); rt(180 // nr); av()
# Tracer les cercles concentriques
for i in range(1, nc + 1):
    ce(); pn()
    lg((nc + 1 - i) * dc)
    av()
    pqtg(); vg(); vg(); vg(); vg()
lc()
# Peintre
for i in range(1, nc + 1):
    ce(); pn()
    lg((nc + 1 - i) * dc - 3)
    if i % 2 == 1:
        rt(180 // nr)
    for j in range(nr):
        ce(); rt(180 // nr); av(); pqtg()
        peindre(); pqtd()
        ce(); rt(180 // nr)
st()
