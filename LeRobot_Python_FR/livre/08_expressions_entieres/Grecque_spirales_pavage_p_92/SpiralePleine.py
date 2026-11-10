from LibRobot import *

# Dessiner une spirale pleine
# Dessiner le côté 'extérieur' de la spirale pleine
for i in range(1, 11):
    for j in range(2 * i):
        av()
    pqtd()
# Dessiner l'extrémité du grand bout
av(); pqtd(); av()
# Dessiner le côté 'intérieur' de la spirale pleine
for i in range(1, 10):
    for j in range(20 - 2 * i):
        av()
    pqtg()
# Dessiner l'extrémité du petit bout
av(); pqtd(); av(); st()
