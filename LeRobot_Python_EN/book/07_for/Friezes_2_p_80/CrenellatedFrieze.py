from LibRobot import *

# Draw a crenellated frieze

# The robot facing east, draw a crenellated
# pattern
def crenelPattern():
    fd(); qtr(); fd(); fd(); qtl(); fd(); qtr()
    cl()
    cl(); qtr(); fd(); qtl(); fd(); fd(); qtr()
    fd()

# The robot facing north, draw a frieze
# of 7 crenellated patterns
def frieze():
    qtr()
    for i in range(7):
        crenelPattern()

gl(); frieze(); st()
