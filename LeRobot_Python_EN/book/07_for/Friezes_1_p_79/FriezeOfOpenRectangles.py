from LibRobot import *

# Draw a frieze of open rectangles
# Go to the west border
gl(); pu(); qtr(); fd(); ht(); pd()
for u in range(6):
    # Draw a rectangle open to the north
    fd(); qtl(); fd(); fd(); qtl(); fd(); fd()
    fd(); qtl(); fd(); fd()
    qtl(); fd()
    # Cross to the south-east
    pu(); tetl(); fd(); fd(); tetr(); pd()
    # Draw a rectangle open to the south
    fd(); qtr(); fd(); fd(); qtr(); fd(); fd()
    fd(); qtr(); fd(); fd()
    qtr(); fd()
    # Cross to the north-east
    pu(); tetr(); fd(); fd(); tetl(); pd()
# Draw a rectangle open to the north
fd(); qtl(); fd(); fd(); qtl(); fd(); fd()
fd(); qtl(); fd(); fd()
qtl(); fd()
# Cross to the south-east
pu(); tetl(); fd(); fd(); tetr(); pd()
# Draw a rectangle open to the south
fd(); qtr(); fd(); fd(); qtr(); fd(); fd()
fd(); qtr(); fd(); fd()
qtr(); fd(); st()
