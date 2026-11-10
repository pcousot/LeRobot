from LibRobot import *

# Sierpinski triangle
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        rot(-120)
        segment(n - 1)
        rot(-120)
        segment(n - 1)
        rot(-120)
        pu(); segment(n - 1); pd()
        segment(n - 1)

def triangle(n):
    rot(-30)
    for i in range(3):
        segment(n); rot(-120)

gb(); gl(); gs(3); triangle(4); st()
