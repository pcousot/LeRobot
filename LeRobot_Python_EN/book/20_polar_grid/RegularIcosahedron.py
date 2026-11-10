from LibRobot import *

# Draw the net of a regular icosahedron
side = 25

# Draw an equilateral triangle starting from the left
# corner of the base and bring the robot back to the
# right corner of the base. The robot faces north in
# both cases.
def equilateralTriangle():
    gsRT(side, 60); etr(); fd(); qtr(); fd()
    tetr(); fdn(2); ht()
    fdn(2); qtl()

# Draw a double row of 5 equilateral triangles, the
# triangles of the two rows having the same bases.
def doubleRowOfTriangles():
    for i in range(2):
        for j in range(5):
            equilateralTriangle()
        ht()

def icosahedron():
    doubleRowOfTriangles()
    # Go down to the start of the second double row
    # of triangles
    pu(); ht(); fd(); qtr(); fd(); qtr(); pd()
    doubleRowOfTriangles()

icosahedron()
st()
