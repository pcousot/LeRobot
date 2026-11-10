from LibRobot import *

# Sierpinski pentagon
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        pu(); segment(n - 1); pd()
        segment(n - 1)

def pentagon(n):
    for i in range(5):
        segment(n - 1)
        rot(-72)

fe(); gt(); gs(4); pentagon(4); st()
