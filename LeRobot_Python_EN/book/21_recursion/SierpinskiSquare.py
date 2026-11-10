from LibRobot import *

# Sierpinski square
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        pu(); segment(n - 1); pd()
        segment(n - 1)

def square(n):
    for i in range(4):
        segment(n); qtr()

gl(); gb(); gs(2); square(4); st()
