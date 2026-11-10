from LibRobot import *

# Draw a frieze of triangles from one edge to the other

# Reach the edge by moving straight ahead
def toEdge():
    pu()
    while not tb():
        fd()
    pd()

def pattern():
    if not tb():
        fd(); tetl(); fd(); tetl(); fd()
        if not tb():
            fd(); tetr(); fd(); tetr(); fd()

def frieze():
    fne()
    while not tb():
        pattern()

fw(); toEdge(); frieze(); st()
