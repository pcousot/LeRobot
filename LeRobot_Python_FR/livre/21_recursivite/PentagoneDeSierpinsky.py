from LibRobot import *

# Pentagone de Sierpinski
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

pe(); eh(); lg(4); pentagone(4); st()
