from LibRobot import *

# Draw a Greek cross
def side():
    fd(); fd(); fd()

def end():
    qtl(); fd(); qtl()

# Draw the left side, the end and then the right
# side of an arm, and turn the robot towards
# the next arm.
def arm():
    side(); end(); side(); qtr()

def cross():
    arm(); arm(); arm(); arm()

cross(); st()
