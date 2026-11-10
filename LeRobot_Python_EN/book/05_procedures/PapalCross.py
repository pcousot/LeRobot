from LibRobot import *

# Draw a papal cross

# Draw an arm of length 1
def arm1():
    qtr(); fd(); qtl(); fd(); qtl(); fd(); qtr()

# Draw an arm of length 2
def arm2():
    qtr(); fd(); fd(); qtl(); fd(); qtl()
    fd(); fd(); qtr()

# Draw half a cross
def halfCross():
    fd(); arm1(); fd(); arm2(); fd()
    arm1(); fd(); qtl(); fd()

def cross():
    halfCross(); qtl(); halfCross()

cross(); st()
