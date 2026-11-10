from LibRobot import *

# Draw a frieze of slanted X's
gl()
for l in range(20):
    # The robot facing north, draw a
    # slanted X
    # NW-SE branch
    qtr(); fd(); etr(); fd(); fd(); etl(); fd()
    # Go back to the centre of the X
    ht(); fd(); etr(); fd()
    # SW half-branch
    qtl(); fd(); tetl(); fd()
    # Go back to the centre of the X
    ht(); fd(); tetr(); fd()
    # NE half-branch
    fd(); tetl(); fd()
    # Turn the robot back to face north
    qtr()
st()
