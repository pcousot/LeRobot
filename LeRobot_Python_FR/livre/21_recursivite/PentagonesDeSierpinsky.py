from LibRobot import *

# Pentagones de Sierpinski d'ordres 1 à 4
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        segment(n - 1)
        rt(-72)
        segment(n - 1)
        rt(-72)
        segment(n - 1)
        rt(-72)
        segment(n - 1)
        rt(-72)
        segment(n - 1)
        rt(-72)
        lc(); segment(n - 1); bc()
        segment(n - 1)

def pentagone(n):
    for i in range(5):
        segment(n - 1)
        rt(-72)

def troisPuissance(n):
    if n <= 0:
        return 1
    else:
        return 3 * troisPuissance(n - 1)

for i in range(1, 5):
    cf(blanc); eh(); pe()
    lg(324 // troisPuissance(i))
    pentagone(i)
    marquerUnePause()
st()
