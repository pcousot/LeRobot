from LibRobot import *

# Draw a Saint Andrew's cross, that is, a
# Greek cross tilted by an eighth of a turn
def side():
    fd(); fd(); fd()

def end():
    qtl(); fd(); qtl()

def arm():
    side(); end(); side(); qtr()

def greekCross():
    arm(); arm(); arm(); arm()

def saintAndrewsCross():
    etr(); greekCross()

saintAndrewsCross(); st()
