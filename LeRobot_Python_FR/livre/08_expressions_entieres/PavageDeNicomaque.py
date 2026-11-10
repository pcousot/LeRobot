from LibRobot import *

# Paver un carré à l'aide de couronnes successives
# constituées de carrés de tailles 1, 2, 3, ... en
# partant du centre.
for i in range(1, 5):
    # Dessiner les 4 côtés de la i-ème couronne en les
    # pavant avec des carrés de taille i.
    for j in range(4):
        # Dessiner un côté de la i-ème couronne, pavé de
        # i carrés de longueur de côté i, le robot
        # partant du premier carré et arrivant au
        # dernier carré dans le même coin et dans la
        # même direction qu'au départ.
        # Dessiner i - 1 carrés de la i-ème couronne
        for k in range(i - 1):
            # Dessiner un carré de longueur i, le robot
            # partant et arrivant au même coin et dans la
            # même direction.
            for l in range(4):
                for m in range(i):
                    av()
                pqtd()
            # Avancer jusqu'au carré suivant de la i-ème
            # couronne.
            pqtd()
            for l in range(i):
                av()
            pqtg()
        # Dessiner le i-ème carré de longueur i de la
        # i-ème couronne.
        for k in range(4):
            for l in range(i):
                av()
            pqtd()
        # Pivoter d'un quart de tour pour placer le
        # robot au début du côté suivant de la i-ème
        # couronne.
        pqtd()
    # Rejoindre le point de départ de la (i + 1)-ème
    # couronne.
    pqtg()
    for j in range(i):
        av()
    pqtd()
    for j in range(i):
        av()
st()
