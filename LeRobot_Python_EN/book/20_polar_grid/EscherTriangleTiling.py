from LibRobot import *

# Escher-style tiling of the triangle
r = 5  # Size of a point of the star

def hexagon():
    for i in range(6):
        fd(); rot(60)

def star():
    for i in range(6):
        fd(); rot(60); fd(); rot(240)

def wavyTriangle():
    pw(2); etr(); cr(); cl(); gsRT(valGsX(), 60)
    tetl(); cr(); cl(); qtl()
    cr(); cl()
    pw(1)

def pattern():
    # Triangle
    gs(r * 5); wavyTriangle()
    # Hexagon
    pu(); qtl(); gs(r * 5); fd(); etl(); gs(r)
    fd()
    pd(); gsRT(r * 2, 54)
    pd(); hexagon(); pu(); ht(); gs(r); fd()
    tetl()
    gs(r * 5)
    fd(); qtl(); pd()
    # Star
    pu(); gsRT(r * 5, 60); fdn(2); gs(r); ht(); fd()
    gsRT(r, 60); etl(); pd()
    star(); pu(); etr(); gs(r); ht(); fd()
    gsRT(r * 5, 60); fdn(-2)
    pd()

def patternWithoutStar():
    # Triangle
    gs(r * 5); wavyTriangle()
    # Hexagon
    pu(); qtl(); gs(r * 5); fd(); etl(); gs(r)
    fd()
    pd(); gsRT(r * 2, 54)
    pd(); hexagon(); pu(); ht(); gs(r); fd()
    tetl()
    gs(r * 5)
    fd(); qtl(); pd()

for j in range(1, 4):
    for i in range(j - 1):
        pattern()
    patternWithoutStar()
    pu(); gs(r * 5); qtl(); fdn(j * 2 + 1)
    qtl()
    gsRT(r * 5, 60)
    fdn(2); ht(); pd()
st()
