from LibRobot import *

# Dessiner des bandes en triangle
# Dessiner 10 rectangles de tailles 1, 2,..., 10
# empilés horizontalement
pdt()
for i in range(1, 11):
    av(); pqtd()
    for j in range(i):
        av()
    pqtd(); av(); pqtd()
    for j in range(i):
        av()
    lc(); pqtg(); av(); pdt(); bc()
st()
