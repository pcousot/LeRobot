from LibRobot import *

# Draw a solid spiral
# Draw the 'outer' side of the solid spiral
for i in range(1, 11):
    for j in range(2 * i):
        fd()
    qtr()
# Draw the tip of the long end
fd(); qtr(); fd()
# Draw the 'inner' side of the solid spiral
for i in range(1, 10):
    for j in range(20 - 2 * i):
        fd()
    qtl()
# Draw the tip of the short end
fd(); qtr(); fd(); st()
