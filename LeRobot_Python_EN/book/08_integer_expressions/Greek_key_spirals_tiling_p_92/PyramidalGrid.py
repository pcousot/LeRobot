from LibRobot import *

# Draw a pyramidal grid
# Draw 16 rows of squares placed side by side
# horizontally
gt(); qtr()
for i in range(1, 17):
    # Draw a row of ((2 * i) - 1) squares placed side
    # by side horizontally, starting at the top left
    # and arriving at the top right, the robot facing
    # east in both cases.
    for j in range(2 * i - 1):
        # Draw a square, starting from the top left
        # corner and arriving at the top right corner,
        # the robot facing east in both cases.
        for k in range(4):
            fd(); qtr()
        fd()
    # Go back, without drawing, to the beginning of the
    # next row, the robot facing east at the start
    # and at the end.
    pu(); ht()
    for j in range(2 * i):
        fd()
    qtl(); fd(); qtl(); pd()
st()
