from LibRobot import *

# Draw a cross in a square
r = 60  # Radius of the arcs of the cross.

def square():
    for i in range(4):
        fd(); qtr()

gsRT(2 * r, 45)
square()
gs(valGsX() - r); fd(); qtr()
for i in range(2):
    gs(r); cl(); tetr()
    gsRT(2 * r, 45); gs(valGsX() - r); fd()
    tetr()
    gs(r); cl(); tetr()
    gsRT(2 * r, 45); gs(valGsX() - r); fd()
    pu(); etr(); gs(r); fd(); qtr()
    gsRT(2 * r, 45)
    gs(valGsX() - r); fd(); qtr(); pd()
st()
