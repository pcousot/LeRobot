from LibRobot import *

# Draw the net of a regular tetrahedron
side = 25

def equilateralTriangle():
    gsRT(side, 60); etr(); fd(); qtr(); fd()
    tetr(); fdn(2); ht()
    fdn(2); qtl()

equilateralTriangle(); equilateralTriangle()
etl(); fd(); etl(); fdn(2); qtr()
equilateralTriangle()
st()
