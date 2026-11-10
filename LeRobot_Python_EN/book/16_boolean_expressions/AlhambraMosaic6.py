from LibRobot import *

# Draw an Alhambra mosaic
gridSize = 8  # must be even
numberOfRows = 4
numberOfColumns = 8

def halfPattern():
    etr(); fd(); etr(); fd(); qtl(); fd()
    gs(gridSize // 2)
    tetr(); fd(); qtl(); fd()
    gs(gridSize)
    tetr(); fd(); qtl(); fd(); etr(); fd()
    tetr(); fdn(2)
    gs(gridSize // 2)
    etl(); fd(); qtr(); fd()
    gs(gridSize); etl(); fdn(2)
    # Paint
    fdn(-1); etl()
    if tsw() or tne():
        pc(yellow)
    else:
        pc(indigo)
    paint()
    pc(black); etr(); fd()
    # Put the robot back in its initial orientation
    qtr()

def pattern():
    halfPattern()
    pu(); qtr(); fdn(5); qtr(); fd(); pd()
    halfPattern()

def doublePattern():
    pattern()
    # Next pattern
    pu(); etl(); fdn(2); tetr(); pd()
    pattern()

gs(gridSize); gt(); gl()
translate(1, -3)
for j in range(1, numberOfRows + 1):
    for i in range(numberOfColumns // 2):
        doublePattern()
        # Next double pattern
        pu(); etr(); fdn(2); tetl(); pd()
    # Next row
    if j % 2 == 1:
        pu(); ht(); fdn(6); pd()
    else:
        pu(); fdn(4); ht(); pd()
st()
