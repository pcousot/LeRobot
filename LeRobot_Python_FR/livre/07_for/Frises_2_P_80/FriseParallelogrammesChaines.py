from LibRobot import *

# Dessiner une frise de parallélogrammes chaînés
def friseParallelogrammes():
    for i in range(14):
        # Parallélogramme
        phtd(); av(); phtd(); av(); p3htd(); av()
        phtd(); av()
        # Rejoindre le coin NE
        p3htd(); av(); phtd(); av()
        # Lien avec le coin SW du parallélogramme suivant
        phtd(); av(); p3htg()

ag(); friseParallelogrammes(); pdt()
friseParallelogrammes(); st()
