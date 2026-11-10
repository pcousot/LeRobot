from LibRobot import *

# Draw a frieze of triangles and squares

# Draw a triangle, tip to the right. The robot starts
# from the SW corner, facing north, and arrives at the
# same level under the tip, facing N.
def triangle_R():
    fd(); fd(); tetr(); fd(); qtr(); fd(); tetl()
    pu(); fd(); qtl(); pd()

# Draw a square starting from the SW corner (robot
# facing N) and place the robot at the SE corner facing N.
def square():
    # Draw a square starting from the SW corner (robot
    # facing N)
    for i in range(4):
        fd(); fd(); qtr()
    # Place the robot at the SE corner, facing N
    qtr(); fd(); fd(); qtl()

# Draw a triangle, tip to the left. The robot starts
# from the tip, facing north, and arrives at the same
# level, in the middle of the long east side, facing N.
def triangle_L():
    etr(); fd(); tetr(); fd(); fd(); tetr(); fd()
    pu(); tetr(); fd(); qtl(); pd()

gl()
for j in range(4):
    # Draw 3 triangles, tips to the right
    for i in range(3):
        triangle_R()
    # Draw a square
    square()
    # Draw 3 triangles, tips to the left
    fd()
    for i in range(3):
        triangle_L()
    # Draw a square, against the last triangle
    # Go down to the SW corner of the square
    ht(); fd()
    # Turn the robot to face north
    ht(); square()
st()
