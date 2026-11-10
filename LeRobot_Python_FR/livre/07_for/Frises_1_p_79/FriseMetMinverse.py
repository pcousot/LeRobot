from LibRobot import *

# Dessiner une frise de M et de M inversés
ag(); phtd()
for i in range(10):
    # Dessiner un motif | |/\
    p3htd(); av(); av(); p3htg(); av(); pqtd()
    av()
    # Dessiner un motif |\/ |
    p3htg(); av(); av(); p3htd(); av(); pqtg()
    av()
# Terminer la dernière branche | |
p3htd(); av(); av(); st()
