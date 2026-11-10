from LibRobot import *

# Tiling of juxtaposed octagons
gridSize = 6

# Place the robot at the left of the n-th row of
# tiles
def row(n):
    gt(); gl(); pu(); fs()
    for k in range(n - 1):
        fdn(2)
    fd(); ht(); pd()

# Draw an octagonal tile
def tile():
    for c in range(8):
        etr(); fd()

# Leave room for the square cabochon
def skipToTheRight():
    pu(); qtr(); fdn(4); qtl(); pd()

# Draw a row of n tiles
def rowOfTiles(n):
    for p in range(n):
        tile(); skipToTheRight()

# Shift the starts of the odd-numbered rows
def shift():
    pu(); qtr(); fdn(2); qtl(); pd()

def tiling(nbRows, nbColumns):
    for l in range(1, nbRows + 1):
        row(l)
        if l % 2 == 1:
            shift(); rowOfTiles(nbColumns - 1)
        else:
            rowOfTiles(nbColumns)

gs(gridSize)
tiling(12, 8)
st()
