from LibRobot import *

# Draw a frieze of diamond points

# Draw a rectangle, the robot starting from the
# lower left corner and arriving at the lower right
# corner, facing north.
def rectangle():
    fd(); fd(); qtr(); fd(); fd(); fd(); fd()
    qtr(); fd(); fd(); qtr(); fd()
    fd(); fd(); fd()

# Draw a diamond point, the robot starting from the
# lower left corner and arriving at the lower right
# corner, facing north.
def diamondPoint():
    rectangle()
    tetr(); fd(); qtl(); fd(); ht(); fd(); etl()
    fd(); fd(); etl(); fd()
    ht(); fd()
    qtl(); fd(); tetl()

# Draw a frieze of ten diamond points
# side by side
def frieze():
    for i in range(10):
        diamondPoint()

gl(); frieze(); st()
