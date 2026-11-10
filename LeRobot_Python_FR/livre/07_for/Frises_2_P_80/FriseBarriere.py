from LibRobot import *

# Dessiner une frise en forme de barrière

# Dessiner le motif de la barrière en forme de n
def n():
    av(); av(); pqtd(); av(); av(); pqtd(); av()
    av(); pdt()

# Dessiner une barrière
def barriere():
    for i in range(20):
        n()

ag(); barriere(); st()
