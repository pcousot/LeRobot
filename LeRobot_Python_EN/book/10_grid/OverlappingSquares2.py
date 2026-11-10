from LibRobot import *

# Draw overlapping squares by enlarging the
# grid
def square():
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    qtr()

gb(); gl()
for i in range(1, 15):
    gs(6 * i); square()
st()
