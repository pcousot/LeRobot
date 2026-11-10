from LibRobot import *

# Alhambra mosaic
rowLength = 7
numberOfRows = 6

# At the start and at the end of the drawing of the
# pattern, the robot is at the foot of the pattern,
# facing north
def pattern():
    cr(); qtl(); cl(); cl(); qtl(); cr(); ht()
    pu(); fd(); paint(); fdn(-1); pd()

# Move the robot from the foot of a pattern to the
# next one, the robot facing north
def nextPattern():
    pu(); qtr(); fdn(2); qtl(); pd()

# Row of tiles
def row():
    for i in range(rowLength - 1):
        pattern(); nextPattern()
    pattern()

# Go back to the start of the next row
def newRow():
    pu(); qtr(); fdn(-(2 * (rowLength - 1)))
    qtl(); fdn(-2); pd()

def tiling():
    for i in range(numberOfRows - 1):
        row(); newRow()
    row()

pu(); gl(); gt(); qtr(); fd(); qtr(); fdn(2)
ht(); pd()
tiling(); st()
