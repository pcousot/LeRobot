from LibRobot import *

# Tracer la courbe y = sin x, x entre -2 pi et 2 pi

# Tracer un trait tout droit jusqu'au bord.
def axe():
    while not tb():
        av()

# Tracer 4 axes dans les directions N, E, S et W.
def axes():
    for i in range(4):
        ce(); pqtd(); axe()

# Graduer l'axe des X aux points coupés par la courbe
# y = sin x.
def graduationX(x):
    if abs(sin(x)) <= 0.00001:
        ecrire(reelEnChaine(x))

# Graduer l'axe des Y.
def graduationY():
    deplacer(0, 1); dc(); ecrire(" 1")
    deplacer(0, -1); dc(); ecrire(" -1")

axes(); lgX(40); lgY(80); graduationY()
deplacerReel(-(2 * pi), sin(-(2 * pi)))
graduationX(-(2 * pi))
for x in range(-359, 361):
    tracerReel(x * pi / 180, sin(x * pi / 180))
    graduationX(x * pi / 180)
st()
