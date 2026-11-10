from LibRobot import *

# Figure explaining the command gsRT
r = 90
t = 30

def dottedLine(n):
    for i in range(1, n + 1):
        if i % 2 == 1:
            pu()
        fd()
        if i % 2 == 1:
            pd()

# Mark the diagonal, the angle and the grid square of x
# by y pixels
def mark(x, y):
    # Mark the diagonal with R
    pu(); gc()
    gsRT(r / 2, t)
    fne(); fd(); fw(); gs(12)
    fdn(4)
    label("R = " + intToString(r))
    # Mark the angle with T
    gsRT(10, t)
    gc(); fe(); fdn(2); qtl(); pd(); cl()
    pu(); ht(); fdn(2)
    label("T = " + intToString(t) + "°"); pd()
    gc()
    # Draw the coordinate frame
    gc(); fe(); gs(2)
    dottedLine(round(x / 2)); qtl()
    dottedLine(round(y / 2))
    # Mark the coordinate frame
    pu(); gsX(round(x / 2))
    gsY(round(y / 2))
    gc(); fe(); fdn(2); fn(); fd()
    label(" Y = " + intToString(round(y)))
    gc(); fe(); fd(); fs(); gs(12); fd()
    label("X = " + intToString(round(x)))
    # Put the robot back in its initial position
    gc(); fn(); pd()

# Draw the diagonal
gsRT(r, t); dg()
fne(); fd()
mark(valGsX(), valGsY())
# Explanation
message("gsRT(R, T) defines the same grid as gsX(X); gsY(Y)")
markPause()
