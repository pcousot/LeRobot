from LibRobot import *

# Draw a rectangle and an ellipse side by side.
# Size of the grid
gsX(40); gsY(20); gl()
# Grid
dg()
# Rectangle
fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
qtr()
# Shift to the right.
pu(); qtr(); fd(); fd(); qtl(); pd()
# Ellipse
cr(); cr(); cr(); cr()
st()
