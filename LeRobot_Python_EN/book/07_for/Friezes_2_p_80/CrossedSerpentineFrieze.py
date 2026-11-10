from LibRobot import *

# Draw a crossed serpentine frieze
def upperPattern():
    cr(); qtr(); fd(); ht(); fd(); qtr(); cr()

def lowerPattern():
    cl(); qtl(); fd(); ht(); fd(); qtl(); cl()

def frieze():
    for i in range(10):
        upperPattern(); lowerPattern()

gl(); frieze(); st()
