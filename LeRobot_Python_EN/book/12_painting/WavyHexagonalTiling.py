from LibRobot import *

# Tiling of the plane in black and white with a wavy
# hexagonal pattern
l = 15  # Side of the grid

def patternOutline():
    gs(l); etl(); cr(); cl()
    gsRT(l, 60); etl(); cr(); cl()
    qtl(); cr(); cl()
    gs(l); etl(); cr(); cl()
    gsRT(l, 60); etl(); cr(); cl()
    qtl(); cr(); cl()

def patternInside():
    pw(2)  # To avoid leaks
    gs(l); etl(); cr()
    gsRT(l, 60); etl(); cl(); cr()
    gs(l); etr(); cl()
    gsRT(l, 60); tetl(); cr()
    gs(l); etl(); cl(); cr()
    gsRT(l, 60); etr(); cl()
    qtl(); cr()
    qtl(); cl(); cr()
    qtr(); cl()
    pw(1)

def paintPatternInside():
    pu(); tetl(); fd(); paint(); ht(); fd()
    pd(); tetl()

# Draw a pattern starting and ending at the lower
# left corner, the robot facing east
def pattern():
    patternOutline(); patternInside()
    paintPatternInside()

def goToNextPattern():
    pu(); gsRT(l, 60); fdn(4); gs(l); fdn(4); pd()

def toTop():
    pu(); gs(1); gt(); gs(l); ht(); fdn(4); qtl()
    pd()

def toLeft():
    pu(); gs(1); gl(); fd(); gs(l); fdn(1); pd()

def row():
    for i in range(3):
        pattern(); goToNextPattern()
    pattern()

def shift():
    pu(); gs(l); fdn(2); gsRT(l, 60); fdn(2); pd()

def goDown():
    pu(); qtr(); gsRT(l, 60); fdn(2); qtl(); pd()

toTop(); toLeft(); row()
toLeft(); shift(); goDown(); row()
toLeft(); goDown(); row()
toLeft(); shift(); goDown(); row()
toLeft(); goDown(); row()
toLeft(); shift(); goDown(); row()
st()
