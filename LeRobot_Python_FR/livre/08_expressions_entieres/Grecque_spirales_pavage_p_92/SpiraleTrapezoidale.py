from LibRobot import *

# Dessiner une spirale trapézoïdale
av(); pqtd()
for i in range(1, 10):
    # Dessiner le côté supérieur
    av()
    # Dessiner un côté droit
    phtd()
    for j in range(2 * i):
        av()
    # Dessiner le côté inférieur
    p3htd()
    for j in range(4 * i + 2):
        av()
    # Dessiner un côté gauche
    p3htd()
    for j in range(2 * i + 1):
        av()
    phtd()
st()
