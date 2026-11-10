from LibRobot import *

# Dessiner le développement d'un isocaèdre régulier
cote = 25

# Dessiner un triangle équilatéral en partant du coin
# gauche de la base et ramener le robot au coin droit
# de la base. Le robot est orienté au nord dans les
# deux cas.
def triangleEquilateral():
    lgRT(cote, 60); phtd(); av(); pqtd(); av()
    p3htd(); avf(2); pdt()
    avf(2); pqtg()

# Dessiner une double rangée de 5 triangles
# équilatéraux, les triangles des deux rangées ayant
# même bases.
def doubleRangeeDeTriangles():
    for i in range(2):
        for j in range(5):
            triangleEquilateral()
        pdt()

def isocaedre():
    doubleRangeeDeTriangles()
    # Descendre au départ de la deuxième double rangée
    # de triangles
    lc(); pdt(); av(); pqtd(); av(); pqtd(); bc()
    doubleRangeeDeTriangles()

isocaedre()
st()
