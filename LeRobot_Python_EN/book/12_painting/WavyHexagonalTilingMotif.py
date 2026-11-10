from LibRobot import *

# Motif of the wavy hexagonal tiling drawn on a
# hexagon of equilateral triangles
l = 50  # Side of a triangle

# Draw a row of n equilateral triangles
def rowOfEquilateralTriangles(n):
    gsRT(l, 60)
    for i in range(n):
        etl(); fd(); qtr(); fd(); etl()
    ht(); fdn(2 * n); ht()

def hexagonOfEquilateralTriangles():
    for i in range(2):
        rowOfEquilateralTriangles(4)
        etl(); fd(); etr()
        rowOfEquilateralTriangles(3)
        etl(); fd(); etr()
        gs(l); fdn(2); etr()
        gsRT(l, 60); fdn(2); tetr()
    etr(); fdn(2); etl()

def patternOutline():
    gs(l); etl(); cr(); cl()
    gsRT(l, 60); etl(); cr(); cl()
    qtl(); cr(); cl()
    gs(l); etl(); cr(); cl()
    gsRT(l, 60); etl(); cr(); cl()
    qtl(); cr(); cl()

def patternInside():
    gs(l); etl(); cr()
    gsRT(l, 60); etl(); cl(); cr()
    gs(l); etr(); cl()
    gsRT(l, 60); tetl(); cr()
    gs(l); etl(); cl(); cr()
    gsRT(l, 60); etr(); cl()
    qtl(); cr()
    qtl(); cl(); cr()
    qtr(); cl()

qtr(); hexagonOfEquilateralTriangles()
pw(2); patternOutline()
pw(4); patternInside()
st()
