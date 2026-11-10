from LibRobot import *

# Dessiner une frise de triangles et de carrés

# Dessiner un triangle, pointe à droite. Le robot part
# du coin SW, orienté au nord et arrive au même niveau
# sous la pointe orienté N.
def triangle_D():
    av(); av(); p3htd(); av(); pqtd(); av(); p3htg()
    lc(); av(); pqtg(); bc()

# Dessiner un carré en partant du coin SW (robot
# orienté N) et placer le robot au coin SE orienté N.
def carre():
    # Dessiner un carré en partant du coin SW (robot
    # orienté N)
    for i in range(4):
        av(); av(); pqtd()
    # Placer le robot au coin SE, orienté N
    pqtd(); av(); av(); pqtg()

# Dessiner un triangle, pointe à gauche. Le robot part
# de la pointe orienté au nord et arrive au même
# niveau, au milieu du grand côté est, orienté N.
def triangle_G():
    phtd(); av(); p3htd(); av(); av(); p3htd(); av()
    lc(); p3htd(); av(); pqtg(); bc()

ag()
for j in range(4):
    # Dessiner 3 triangles, pointes à droite
    for i in range(3):
        triangle_D()
    # Dessiner un carré
    carre()
    # Dessiner 3 triangles, pointes à gauche
    av()
    for i in range(3):
        triangle_G()
    # Dessiner un carré, collé au dernier triangle
    # Descendre au coin SW du carré
    pdt(); av()
    # Orienter le robot au nord
    pdt(); carre()
st()
