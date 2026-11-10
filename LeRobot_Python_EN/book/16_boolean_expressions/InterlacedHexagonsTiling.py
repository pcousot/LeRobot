from LibRobot import *

# Draw a tiling of interlaced hexagons
gridSizeUnit = 2
numberOfRows = 8
numberOfColumns = 6

# Cells of 4 x 8 units and north orientation for
# the vertical hexagon, cells of 8 x 4 units and
# west orientation for the horizontal hexagon.
def hexagon():
    for i in range(2):
        for j in range(3):
            etr(); fd()
        etr()

# Cells of width x and height y units
def cells(x, y):
    gsX(x * gridSizeUnit)
    gsY(y * gridSizeUnit)

def verticalHexagonsTiling():
    gs(gridSizeUnit); gl(); gt()
    cells(4, 8)
    pu(); ht(); fd(); ht(); pd()
    for l in range(1, numberOfRows + 1):
        for c in range(numberOfColumns - 1):
            hexagon()
            # Go to the next hexagon
            pu(); qtr(); fdn(4); qtl(); pd()
        if l % 2 == 1:
            hexagon()
        # Go to the next row
        pu(); gs(gridSizeUnit); gl()
        cells(4, 8)
        if l % 2 == 1:
            ht(); fd(); qtl(); fdn(2); qtl()
        else:
            ht(); fd(); ht()
        pd()

def horizontalHexagonsTiling():
    gs(gridSizeUnit); gl(); gt()
    pu(); tetr()
    gs(14 * gridSizeUnit)
    fd(); tetr(); pd()
    cells(8, 4)
    for l in range(1, numberOfRows + 1):
        for c in range(numberOfColumns - 2):
            hexagon()
            # Go to the next hexagon
            pu(); ht(); fdn(2); ht(); pd()
        if l % 2 == 1:
            hexagon()
        # Go to the next row
        pu(); gs(gridSizeUnit); gl()
        ht(); gsX(6 * gridSizeUnit)
        fd(); ht()
        cells(8, 4)
        if l % 2 == 1:
            qtl(); fdn(2); qtl(); fdn(2); ht()
        else:
            qtl(); fdn(2); qtl(); fd(); ht()
        pd()

verticalHexagonsTiling()
horizontalHexagonsTiling()
st()
