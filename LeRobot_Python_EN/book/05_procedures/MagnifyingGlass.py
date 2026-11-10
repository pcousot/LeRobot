from LibRobot import *

# Draw a magnifying glass

# Go up to the starting point, at the bottom left of the lens
# of the magnifying glass
def goToStart():
    pu(); fd(); fd(); fd(); pd()

def fiveSteps():
    fd(); fd(); fd(); fd(); fd()

def sevenSteps():
    fiveSteps(); fd(); fd()

# Draw the inner edge of the lens of the magnifying glass
def innerEdgeOfLens():
    fiveSteps(); cr(); fiveSteps(); cr()
    fiveSteps(); cr(); fiveSteps(); cr()

# Go to the outer edge of the lens holder
def goToOuterEdge():
    qtl(); pu(); fd(); qtl(); fd(); ht(); pd()

# Draw the outer edge of the lens holder
def outerEdgeOfLens():
    sevenSteps(); cr(); sevenSteps(); cr()
    sevenSteps(); cr(); sevenSteps(); cr()

# Go to the top of the handle, on the left
def goToTopOfHandle():
    ht(); cl(); fd(); fd(); qtr()

# Draw the first groove of the handle
def firstGroove():
    cl(); fd(); cl()
    pu(); qtl(); fd(); fd(); fd(); qtl(); pd()

# Draw a next groove of the handle
def nextGroove():
    fd(); cl(); fd(); cl(); fd()
    pu(); qtl(); fd(); fd(); fd(); qtl(); fd()
    pd()

# Draw the grooved handle of the magnifying glass
def handle():
    firstGroove()
    nextGroove(); nextGroove()
    nextGroove(); nextGroove()
    nextGroove(); nextGroove()
    nextGroove(); nextGroove()
    nextGroove(); nextGroove()

goToStart()
innerEdgeOfLens()
goToOuterEdge()
outerEdgeOfLens()
goToTopOfHandle()
handle()
st()
