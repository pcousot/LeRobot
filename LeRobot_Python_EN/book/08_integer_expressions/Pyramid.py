from LibRobot import *

# Draw a pyramid with 5 levels.
# Turn the robot to the west.
qtl()
for i in range(1, 6):
    # Starting from the bottom left corner of a level
    # with the robot facing west, draw the bottom left
    # corner of the level below and turn to the east.
    fd(); qtl(); fd(); qtl()
    # Draw the i-th rectangular level.
    # Bottom side
    for j in range(2 * i - 1):
        fd()
    # Right end
    qtl(); fd(); qtl()
    # Top side
    for j in range(2 * i - 1):
        fd()
    # Go back down to the bottom left corner and turn
    # the robot to the west.
    qtl(); fd(); qtr()
st()
