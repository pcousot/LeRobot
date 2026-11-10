from LibRobot import *

# Draw the net of a cube
side = 18

def square():
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    qtr(); fd()

gb(); gs(side)
square(); square(); square()
qtl(); fd(); qtr(); square()
qtr(); fd(); qtl(); square()
qtr(); fd(); qtr(); fd(); qtl(); square()
st()
