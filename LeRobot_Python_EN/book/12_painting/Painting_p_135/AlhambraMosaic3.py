from LibRobot import *

# Alhambra mosaic
gridSize = 3  # pixels
patternWidth = 4  # times the grid size
patternHeight = 6  # times the grid size
rowLength = 7  # patterns of an odd row
numberOfRows = 12  # even

# Draw an 8-shaped pattern, starting and
# ending at the end of the lower left
# point, with the robot facing north.
def pattern():
    for i in range(2):
        # Left/right side (above/below the
        # lower point).
        etr(); fd(); etl(); fdn(patternHeight - 4)
        etl(); fd(); qtr(); fd()
        # Top/bottom
        etr(); fdn(patternWidth - 2); etr()
        # Top/bottom of the right/left side (above/below
        # the upper/lower point).
        fd(); etr()
    # Colour and turn the robot to its initial
    # orientation.
    qtl(); paint(); qtr()

# Go from the lower left point of a pattern to that
# of the next pattern on the same horizontal
# row to the right.
def nextPattern():
    pu(); qtr(); fdn(2 * patternWidth); qtl(); pd()

# Draw a horizontal row containing
# rowLength patterns.
def oddRow():
    for i in range(rowLength):
        pattern(); nextPattern()

# Draw a row containing (rowLength - 1)
# patterns.
def evenRow():
    for i in range(rowLength - 1):
        pattern(); nextPattern()

# Go back to the lower left point of the first
# pattern of a row.
def backToRowStart():
    pu(); qtl()
    fdn(2 * patternWidth * rowLength - patternWidth)
    qtr(); pd()

# Go from the lower left point of a pattern to
# that of the pattern straight below, on the
# next row.
def nextRow():
    pu(); fdn(-(patternHeight - 2)); pd()

# Tile with a number of rows equal to
# numberOfRows.
def tiling():
    for i in range(numberOfRows // 2):
        oddRow(); backToRowStart()
        nextRow()
        evenRow(); backToRowStart()
        nextRow()

# Place the robot at the lower left point of the
# left pattern of the first row.
pu(); gs(gridSize); gl(); gt(); ht()
fdn(patternHeight); qtl(); fd(); qtl(); pd()
tiling(); st()
