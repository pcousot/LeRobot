from LibRobot import *

# Tiles in three colours
numberOfRows = 10  # even
rowLength = 10  # even

# The robot being at the lower left corner, facing
# east, draw a square in black and come back to the
# starting point, facing south.
def square():
    pc(black)
    fd(); qtl(); fd(); qtl(); fd(); qtl(); fd()

# The robot being at the bottom left of the square,
# facing south, paint the square in the colour of
# the pen, then place the robot at the bottom left
# of the next square, facing east.
def paintSquare():
    etr(); paint(); tetl(); pc(black); fd()

# Draw a row of small blue and red
# tiles
def oddRow():
    for i in range(rowLength // 2):
        square(); pc(blue); paintSquare()
        square(); pc(red); paintSquare()

# Draw a row of small white and indigo
# tiles
def evenRow():
    for i in range(rowLength // 2):
        square(); pc(white); paintSquare()
        square(); pc(indigo); paintSquare()

def newRow():
    fdn(-rowLength); pu(); qtr(); fd(); qtl()
    pd()

def tiling():
    for i in range(numberOfRows // 2):
        oddRow(); newRow()
        evenRow(); newRow()

gl(); gt(); fdn(-1); qtr()
tiling(); st()
