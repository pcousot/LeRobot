from LibRobot import *

# Draw concentric squares
etr()
# Draw a point (square of side zero)
dp()
for i in range(1, 11):
    # Place the robot at the starting point of the
    # next square.
    tetl(); pu(); fd(); tetr(); pd()
    # Draw a square, with sides of length i, the
    # robot starting from and returning to the lower
    # left corner, facing NW.
    for j in range(4):
        # Move forward i positions.
        for k in range(i):
            fd()
        qtr()
st()
