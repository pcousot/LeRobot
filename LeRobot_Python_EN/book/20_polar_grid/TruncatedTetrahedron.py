from LibRobot import *

# Draw the net of a truncated tetrahedron
sideLength = 24

def faceAndCorner():
    # Hexagon
    qtr(); gsRT(sideLength, 60); etl()
    for i in range(6):
        fd(); rot(60)
    # Equilateral triangle
    ht(); fd(); qtr(); fd()

def truncatedTetrahedronNet():
    for i in range(2):
        # Face, bottom corner
        faceAndCorner(); pu(); tetr(); fdn(2); etl(); fd()
        tetr(); pd()
        # Face, top corner
        faceAndCorner(); pu(); fd(); etl(); fdn(2); qtl()
        pd()

truncatedTetrahedronNet(); st()
