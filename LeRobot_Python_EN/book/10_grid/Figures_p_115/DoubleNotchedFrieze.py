from LibRobot import *

# Draw a double notched frieze
def notch():
    qtl(); fd(); qtr(); fd(); qtr(); fd(); qtl()

def bigBar():
    fdn(3); notch(); fdn(3)

def smallBar():
    fdn(2); notch(); fdn(2)

def stepDown():
    qtr(); fdn(2); qtl()

def stepUp():
    qtl(); fdn(2); qtr()

def frieze():
    for j in range(13):
        bigBar(); stepDown(); smallBar(); stepUp()

gs(3)
# Upper frieze (from left to right)
gl(); qtr(); frieze()
# Lower frieze (from right to left)
pu(); fd(); fs(); fdn(3); qtr()
pd(); frieze(); st()
