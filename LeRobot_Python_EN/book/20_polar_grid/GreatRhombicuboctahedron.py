from LibRobot import *

# Draw the net of a great rhombicuboctahedron
c = 12

def square():
    gs(c)
    for i in range(4):
        fd(); qtr()

def hexagon():
    qtr()
    for i in range(2):
        gs(c); fd(); gsRT(c, 60); etl(); fd(); qtl()
        fd()
        etl()
    qtl()

def octagon():
    qtr()
    for i in range(4):
        gs(c); fd(); gsRT(c, 45); etl(); fd(); etl()
    qtl()

# Draw a square with a hexagon above and below it
def squareBetweenHexagons():
    hexagon(); qtr(); gs(c); fd(); qtr(); square()
    fd(); hexagon()

# Draw an octagon with a square above and below it
def octagonBetweenSquares():
    square(); qtr(); fd(); qtr(); octagon(); pu()
    fd(); gs(c); fd()
    gsRT(c, 45)
    fd(); pd(); square()

gl(); pu(); fdn(2); qtr(); fdn(2); qtl(); pd()
for i in range(4):
    octagonBetweenSquares(); pu(); tetl()
    gsRT(c, 45); fd(); etl()
    gs(c)
    fd(); pd(); squareBetweenHexagons(); pu()
    ht(); gs(c); fd()
    gsRT(c, 45)
    etr(); fd(); etl(); pd()
pu(); gs(c); fd(); qtl()
for i in range(6):
    gsRT(c, 45); fd(); gs(c); fd()
qtr(); pd(); octagon(); pu(); ht(); fdn(2); gs(c)
fdn(3); qtl()
fd(); qtr()
pd(); octagon()
st()
