from LibRobot import *

# Escher-style tiling of the triangle, in colour
r = 5  # Size of a point of the star

# The robot does not come back into the hexagon or the
# star before paint (the step of the polar grid is not
# that of the Macintosh): we remember the vertices
# drawn and paint from their centre.
vertices = []

def remember():
    global vertices
    vertices = [(valX(), valY())] + vertices

def paintCentre():
    global vertices
    n = len(vertices)
    a = round(sum(x for (x, y) in vertices) / n)
    b = round(sum(y for (x, y) in vertices) / n)
    vertices = []
    Principal.wait()
    def doIt():
        Principal.draw(False)
        background = Graphics.point_color(a, b)
        if background != Dessin.current_color():
            Peinture.remplir(background, a, b)
        Principal.draw(True)
    record(doIt)

def hexagon():
    for i in range(6):
        fd(); remember(); rot(60)

def star():
    for i in range(6):
        fd(); remember(); rot(60); fd(); remember(); rot(240)

def wavyTriangle():
    etr(); cr(); cl(); gsRT(valGsX(), 60); tetl()
    cr(); cl(); qtl(); cr()
    cl()

def pattern():
    # Triangle
    gs(r * 5); wavyTriangle()
    # Hexagon
    pu(); qtl(); gs(r * 5); fd(); etl(); gs(r)
    fd()
    pd(); gsRT(r * 2, 54)
    pd(); hexagon(); pu(); ht(); gs(r); fd()
    paintCentre(); tetl()
    gs(r * 5)
    fd(); qtl(); pd()
    # Star
    pu(); gsRT(r * 5, 60); fdn(2); gs(r); ht(); fd()
    gsRT(r, 60); etl(); pd()
    star(); pu(); etr(); gs(r); ht()
    paintCentre(); fd()
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
    paintCentre(); tetl()
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
