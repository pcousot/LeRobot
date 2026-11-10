from LibRobot import *

# Triangles de Sierpinski d'ordres 1 à 4
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        segment(n - 1)
        rt(-120)
        segment(n - 1)
        rt(-120)
        segment(n - 1)
        rt(-120)
        lc(); segment(n - 1); bc()
        segment(n - 1)

def triangle(n):
    rt(-30)
    for i in range(3):
        segment(n); rt(-120)

def troisPuissance(n):
    if n <= 0:
        return 1
    else:
        return 3 * troisPuissance(n - 1)

for i in range(1, 5):
    cf(blanc); ag(); eb()
    lg(162 // troisPuissance(i))
    triangle(i)
    marquerUnePause()
st()
