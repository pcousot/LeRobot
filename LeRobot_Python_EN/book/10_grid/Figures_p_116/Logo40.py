from LibRobot import *

# Draw a propeller (grid of 40 pixels)
gs(40); pw(2)
for i in range(4):
    cr(); cr(); cr(); cr(); cr()
    qtr(); fd(); cl(); qtl(); fd(); cl()
st()
