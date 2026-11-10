from LibRobot import *

# Draw a grid of crosses
def cross():
    fd(); qtl(); fd()
    pw(3); dp(); pw(1)
    ht(); fdn(2); ht()
    pw(3); dp(); pw(1)
    fd(); qtr(); fd()

def columnOfCrosses(n):
    for l in range(n):
        cross()

def bottomOfNextColumn():
    pu(); gb(); qtr(); fdn(2); qtl(); pd()

def grid(nbRows, nbColumns):
    for c in range(1, nbColumns + 1):
        bottomOfNextColumn()
        if c % 2 == 1:
            fd(); columnOfCrosses(nbRows); fd()
        else:
            columnOfCrosses(nbRows + 1)

gl(); grid(6, 7); st()
