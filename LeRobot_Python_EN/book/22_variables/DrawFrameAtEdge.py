from LibRobot import *

# Draw a frame around the window

# Reach the edge of the window quickly
def toEdge():
    i = 4096
    while i >= 1:
        gs(i)
        while not tb():
            fd()
        i = i // 2

def reachCornerNE():
    pu(); fn(); toEdge(); fe(); toEdge(); pd()

def drawFrame():
    for i in range(4):
        qtr(); toEdge()

reachCornerNE(); drawFrame(); gc(); st()
