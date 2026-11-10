from LibRobot import *

# Figure explaining the program IsoscelesTriangle
sideLength = 50
angle = 70

def dottedLine(n):
    for i in range(1, n + 1):
        if i % 2 == 1:
            pu()
        fd()
        if i % 2 == 1:
            pd()

# Mark the angle and draw the grid square of x by y
# pixels in dotted lines
def angleAndFrame(x, y):
    # Mark the angle
    gsRT(10, angle)
    ht(); fdn(2); qtl(); cl()
    pu(); ht(); fdn(2)
    label(intToString(angle) + "°"); pd()
    gc()
    # Draw the coordinate frame
    gs(2)
    dottedLine(x); qtl(); dottedLine(y); qtl()
    dottedLine(x); qtl(); dottedLine(y); qtl()

# Draw the triangle
gsRT(sideLength, angle)
etr(); fd(); qtr(); fd(); tetr(); fdn(2)
angleAndFrame(round(valGsX() / 2), round(valGsY() / 2))
st()
