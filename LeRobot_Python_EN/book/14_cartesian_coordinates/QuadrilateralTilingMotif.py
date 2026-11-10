from LibRobot import *

# Motif of the tiling of quadrilaterals inscribed in a
# (6 x 6) square

# Draw a pattern in a (6 x 6) square, the robot
# starting and ending at the centre of the pattern,
# facing north.
def pattern():
    for i in range(4):
        pu(); qtl(); fd(); pd()
        tetr(); fd(); fd(); qtl(); fd(); ht(); fd()
        etl(); fd(); fd(); ht(); fd(); qtr(); fd()
        qtr(); fd()
        pu(); tetr(); fd(); fd(); fd(); pd()
        etr()

pattern(); st()
