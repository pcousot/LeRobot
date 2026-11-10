from LibRobot import *

# Dessiner le développement d'un tétraèdre régulier
cote = 25

def triangleEquilateral():
    lgRT(cote, 60); phtd(); av(); pqtd(); av()
    p3htd(); avf(2); pdt()
    avf(2); pqtg()

triangleEquilateral(); triangleEquilateral()
phtg(); av(); phtg(); avf(2); pqtd()
triangleEquilateral()
st()
