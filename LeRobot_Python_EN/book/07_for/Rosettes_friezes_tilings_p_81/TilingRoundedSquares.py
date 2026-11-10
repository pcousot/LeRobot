from LibRobot import *

# Draw a tiling of squares with rounded corners

# Draw a row of tiles
def row():
    for i in range(20):
        # Draw a tile
        pd()
        for j in range(4):
            # Draw one side of the tile
            fd(); cr()
        # Go to the start of the next tile
        pu(); qtr(); fd(); fd(); qtl()

# Go to the start of the next row of tiles
def goBack():
    ht(); fd(); qtr()
    for i in range(40):
        fd()
    qtl(); fd(); ht()

# Draw 10 rows of tiles
def tiling():
    for i in range(10):
        row(); goBack()

# Place the robot at the top left of the screen
gt(); gl(); pu(); ht(); fd(); fd(); ht()
pd(); tiling(); st()
