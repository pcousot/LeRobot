from LibRobot import *

# Draw a cross bottony

# Draw an arm ending in a trefoil
def arm():
    fd(); fd(); fd(); fd()
    qtr(); cl(); cl(); cr(); ht(); cr(); cl(); cl()
    qtr(); fd(); fd(); fd(); fd()

def cross():
    arm(); qtr(); arm(); qtr()
    arm(); qtr(); arm(); qtr()

cross(); st()
