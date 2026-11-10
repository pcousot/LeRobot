from LibRobot import *

# Draw a frieze of T's
def drawT():
    # Left side
    fd(); qtl(); fd(); qtl(); fd(); qtr(); fd()
    # Top
    qtr(); fd(); fd(); fd(); qtr()
    # Right side
    fd(); qtr(); fd(); qtl(); fd(); qtl(); fd()

gl(); qtr()
for t in range(10):
    drawT()
    fd()  # go to the next T
st()
