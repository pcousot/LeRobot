from LibRobot import *

# Triangle de Sierpinski
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

eb(); ag(); lg(3); triangle(4); st()
