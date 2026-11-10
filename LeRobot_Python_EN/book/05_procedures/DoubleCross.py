from LibRobot import *

# Draw a double cross

# Draw an arm of the cross
def arm():
    qtl(); fd(); fd(); qtr(); fd(); qtr()
    fd(); fd(); qtl()

# Draw half of the cross
def halfCross():
    fd(); fd(); arm(); fd(); arm()
    fd(); fd(); qtr(); fd(); qtr()

def cross():
    halfCross(); halfCross()

cross(); st()
