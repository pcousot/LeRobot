from LibRobot import *

# Draw concentric circles of diameters 3,
# 6, ...
def circle():
    pu(); fd(); qtl(); pd(); cl(); cl()
    cl(); cl(); pu(); qtl(); fd(); ht(); pd()

def concentricCircles():
    for i in range(1, 13):
        gs(3 * i); circle()

concentricCircles(); st()
