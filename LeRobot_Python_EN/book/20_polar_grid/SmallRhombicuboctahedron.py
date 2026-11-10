from LibRobot import *

# Draw the net of a small rhombicuboctahedron
c = 20

def equilateralTriangle():
    gsRT(c, 60); etl(); fd(); qtl(); fd(); tetl()
    fdn(2); qtl()

def square():
    gs(c)
    for i in range(4):
        fd(); qtr()

def stackedSquares():
    square(); qtr(); fd(); qtr(); square(); fd()
    square()

def squareBetweenTriangles():
    equilateralTriangle(); ht(); square(); pu()
    etr(); fd(); etl(); pd()
    equilateralTriangle()

gl(); pu(); fdn(2); pd()
for i in range(4):
    stackedSquares(); squareBetweenTriangles()
pu(); gs(c); fd(); qtl()
for i in range(3):
    gsRT(c, 60); fdn(2); gs(c); fd()
qtr(); pd(); square(); ht(); fdn(3); qtl(); fd()
qtr(); square()
st()
