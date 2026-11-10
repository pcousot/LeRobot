from LibRobot import *

# Tile a square with successive rings made of
# squares of sizes 1, 2, 3, ..., starting from the
# centre.
for i in range(1, 5):
    # Draw the 4 sides of the i-th ring, tiling them
    # with squares of size i.
    for j in range(4):
        # Draw one side of the i-th ring, tiled with
        # i squares of side length i, the robot
        # starting from the first square and arriving
        # at the last square in the same corner and in
        # the same direction as at the start.
        # Draw i - 1 squares of the i-th ring
        for k in range(i - 1):
            # Draw a square of length i, the robot
            # starting and arriving at the same corner
            # and in the same direction.
            for l in range(4):
                for m in range(i):
                    fd()
                qtr()
            # Move forward to the next square of the
            # i-th ring.
            qtr()
            for l in range(i):
                fd()
            qtl()
        # Draw the i-th square of length i of the
        # i-th ring.
        for k in range(4):
            for l in range(i):
                fd()
            qtr()
        # Turn a quarter turn to place the robot at the
        # beginning of the next side of the i-th ring.
        qtr()
    # Go to the starting point of the (i + 1)-th
    # ring.
    qtl()
    for j in range(i):
        fd()
    qtr()
    for j in range(i):
        fd()
st()
