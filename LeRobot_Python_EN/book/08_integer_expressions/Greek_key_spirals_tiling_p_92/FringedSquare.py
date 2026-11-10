from LibRobot import *

# Draw a fringed square
# Go up
pu()
for i in range(3):
    fd()
pd()
# Draw the fringed square
for i in range(1, 5):
    # Draw one side of the square with 5 fringes of
    # lengths i + 1, i + 2, ..., i + 5.
    for j in range(1, 6):
        # Draw a fringe of length (i + j).
        for k in range(i + j):
            fd()
        ht()
        for k in range(i + j):
            fd()
        # Move on to the next fringe.
        qtl(); fd(); qtl()
    # Turn the robot perpendicular to the next
    # side.
    qtr()
st()
