from LibRobot import *

# Draw a triangular grid pattern
# Draw 10 rows of squares side by side
# horizontally
qtr()
for i in range(1, 11):
    # Draw a row of i squares side by side
    # horizontally, starting at the top left and
    # arriving at the top right, the robot facing
    # east in both cases.
    for j in range(i):
        # Draw a square, starting from the upper
        # left corner and arriving at the upper
        # right corner, the robot facing east in
        # both cases.
        for k in range(4):
            fd(); qtr()
        fd()
    # Go back, without drawing, to the start of the
    # next row, the robot facing east at
    # departure and on arrival.
    pu(); ht()
    for j in range(i):
        fd()
    qtl(); fd(); qtl(); pd()
st()
