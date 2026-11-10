from LibRobot import *

# Draw a tiling of cogwheels
gridSize = 10
numberOfPatternsPerRow = 7
numberOfRows = 14

# Move the robot straight on, up to two squares from
# the frame's north edge.
def nearTheTop():
    gt(); ht(); fdn(2)

# Draw the pattern of the tiling
def cogwheel():
    for i in range(4):
        fd(); qtr(); cr(); qtl(); cl(); qtl()

def tiling():
    for l in range(1, numberOfRows + 1):
        pu(); nearTheTop(); gl()
        fdn(l); qtl(); fd()
        # Offset at the start of the row
        if l % 5 == 2:
            fdn(2)
        elif l % 5 == 3:
            fdn(4)
        elif l % 5 == 4:
            fd()
        elif l % 5 == 0:
            fdn(3)
        # Draw a row of patterns
        qtl(); pd()
        for j in range(numberOfPatternsPerRow - 1):
            cogwheel()
            translate(5, 0)
        cogwheel()

gs(gridSize); tiling(); st()
