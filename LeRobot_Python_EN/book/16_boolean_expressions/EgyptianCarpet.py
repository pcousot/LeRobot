from LibRobot import *

# Draw an Egyptian carpet

# Grid size
g = 4
# h is odd. It is the length of the horizontal side
# of the carpet as a number of "bars".
h = 19
# l is odd, l >= 3 and (h - 2 * l) / 2 >= 4.
# It is the length of the horizontal side of the end
# band of the carpet as a number of "bars".
l = 3
# Side of the largest rhombus in the middle, as a
# number of C patterns
side = (h - 2 * l) // 2 - 1
# Height of the outer crenellated border
height = side * 6 + 5 + (7 * 2 + 2) + 2 * 3

# Cells of x by y times g
def cells(x, y):
    gsX(x * g); gsY(y * g)

# Pattern at the four corners
def centralOctagon():
    for i in range(4):
        cells(2, 1); fd(); etr()
        gs(g); fd(); etr()
    pu(); etr(); fdn(3); pd()
    for i in range(4):
        qtr(); fd()
    # Paint
    fdn(-1); pc(red); paint(); pc(black); fd()
    qtl()

def openLeftTriangle():
    gs(g); fdn(3); tetl(); fd()
    gsX(2 * g); fd(); qtl(); fd()
    tetl(); fdn(2)
    # Paint
    fdn(-1); qtr(); pc(red); paint(); pc(black)
    qtr(); fd(); etl()
    gs(g); fd(); etr()

def openLeftTriangleMirror():
    gs(g); fdn(3); tetr(); fd()
    gsX(2 * g); fd(); qtr(); fd()
    tetr(); fdn(2)
    # Paint
    fdn(-1); qtl(); pc(red); paint(); pc(black)
    qtl(); fd(); etr()
    gs(g); fd(); etl()

def leftQuarter():
    openLeftTriangle(); fd(); etr()
    cells(3, 1); fd(); tetr()
    openLeftTriangle()

def leftQuarterMirror():
    openLeftTriangleMirror(); fd(); etl()
    cells(3, 1); fd(); tetl()
    openLeftTriangleMirror()

def endPattern():
    for i in range(2):
        leftQuarter()
        pu(); ht(); fdn(4); qtr(); fdn(3); pd()
        fd(); qtl()
        leftQuarterMirror(); fd()
        pu(); fdn(4); qtr(); fdn(3); qtl(); pd()
    pu(); fdn(-4); qtl(); fdn(2); tetr(); pd()
    centralOctagon()

# Middle pattern
def tile():
    etr(); pu(); fd(); etl(); pd()
    for i in range(4):
        fd(); qtr()
    pu(); tetl(); fd(); etr(); pd()

def tip():
    for i in range(3):
        fd(); qtl(); fd(); qtr(); fd(); qtr()
        fd(); qtl(); fd(); qtr()
    tile()

def cPattern():
    fd(); qtl(); fd(); qtr(); fd(); qtr()
    fd(); qtl(); fd(); qtr(); fdn(2); qtr(); fd()
    qtr(); fd(); qtl(); fd(); qtl(); fdn(2)
    qtl(); fd(); qtr(); fd(); qtl(); fdn(2)
    qtl(); fd(); qtr()

def reverseCPattern():
    qtr(); fd(); qtl(); fdn(2); qtl(); fd()
    qtr(); fd(); qtl(); fdn(2); qtl()
    fd(); qtl(); fd(); qtr(); fd(); qtr()
    fdn(2); qtr(); fd(); qtl(); fd(); qtr()
    fd(); qtr(); fd(); qtl(); fd()

# n = side as a number of C patterns
def rhombus(n):
    for j in range(2):
        fd()
        for i in range(n):
            cPattern()
        tip()
        for i in range(n):
            reverseCPattern()

def middle():
    gsX(g + 1)
    for i in range(side // 2 + 1):
        rhombus(side - 2 * i)
        if i % 3 == 0:
            pc(red)
        elif i % 3 == 2:
            pc(white)
        qtr(); paint(); pc(black); qtl()
        pu(); qtr(); fdn(6); qtl(); pd()
    if (side // 2 + 1) % 3 == 0:
        pc(red)
    elif (side // 2 + 1) % 3 == 2:
        pc(white)
    pu(); qtl(); fdn(6); paint(); pc(black); qtr()
    pd()
    gsX(g)

# Border of the carpet
def notch():
    qtl(); fd(); qtr(); fd(); qtr(); fd(); qtl()

def longBar():
    fdn(3); notch(); fdn(3)

def shortBar():
    fdn(2); notch(); fdn(2)

def stepDown():
    qtr(); fdn(2); qtl()

def stepUp():
    qtl(); fdn(2); qtr()

def outerSide():
    for i in range(h // 2):
        longBar(); stepDown(); shortBar(); stepUp()
    longBar()

# n = number of bars
def innerSide(n):
    for i in range(n // 2):
        shortBar(); stepUp(); longBar(); stepDown()
    shortBar()

def outerRectangle():
    for i in range(2):
        fdn(height + 10)
        qtr(); fdn(h // 2 * 12 + 7 + 10); qtr()

def outerNotchedRectangle():
    fn()
    fdn(height)
    qtr(); outerSide(); qtr()
    fdn(height)
    qtr(); outerSide(); qtr()

def innerNotchedEndRectangle():
    fe()
    innerSide(l); qtl()
    fdn(height - 2)
    qtl(); innerSide(l); qtl()
    fdn(height - 2)
    qtl()

def innerNotchedMiddleRectangle():
    fe()
    pu(); stepUp(); fd(); pd()
    fdn(2); notch(); fdn(3); stepDown()
    innerSide(h - 2 * l - 2)
    stepUp(); fdn(3); notch(); fdn(2); qtl()
    fdn(height - 6)
    qtl(); fdn(2); notch(); fdn(3); stepDown()
    innerSide(h - 2 * l - 2)
    stepUp(); fdn(3); notch(); fdn(2); qtl()
    fdn(height - 6)
    qtl()

def border():
    outerRectangle()
    pu(); fdn(5); qtr(); fdn(5); qtl(); pd()
    outerNotchedRectangle()
    pc(red); paint(); pc(black)
    pu(); fd(); qtr(); fd(); pd()

# Inside of the carpet
def endRectangle():
    innerNotchedEndRectangle()
    pu(); fdn((l - 1) // 2 * 12 // 2 + 2); qtl()
    fdn(12 + 6); pd()
    endPattern(); pu()
    fdn(7 + (height - 2 - 2 * 21) + 3)
    ht(); pd(); endPattern(); pu()
    fdn(7 + (height - 2 - 21)); qtl()
    fdn((l - 1) // 2 * 12 // 2 + 3)
    etr(); paint(); etl(); pd()

def middleRectangle():
    innerNotchedMiddleRectangle()
    pu(); fdn((h - 2 * l) // 2 * 6 + 2); qtl()
    fdn(side * 6 + 5 + 7); qtr(); pd()
    middle()
    pu(); fdn((h - 2 * l) // 2 * 6 + 2 + 2); qtr()
    fdn(side * 6 + 5 + 7 - side // 2 * 6 + 2); pd()

gs(g); gl(); gb()
border()
endRectangle()
middleRectangle()
endRectangle()
st()
