from LibRobot import *

# Tiling of crosses superimposed on squares
gridSizeX = 6
gridSizeY = 6

# Draw a pattern in a (6 x 6) square, the robot
# starting and ending at the centre of the pattern,
# facing north.
def pattern6x6():
    translate(-1, 1)
    for i in range(4):
        fd(); cr(); cr(); fd(); tetl(); fdn(2); fdn(-2)
        etr()
    translate(1, -1)

# Tile with y rows of x (6 x 6) patterns
def tiling(x, y):
    # Shift the drawing to the left by half the
    # length of a row and upwards by
    # half the height of the tiling.
    translate(-(6 * (x // 2)), 6 * (y // 2))
    # Draw (y - 1) rows of x patterns (with
    # translation to the bottom left of the next
    # row).
    for i in range(y - 1):
        # Draw a row of x patterns (without
        # translation to the right after the last pattern
        # of the row).
        for j in range(x - 1):
            pattern6x6()
            # Move to the next pattern on the right in the
            # same row.
            translate(6, 0)
        pattern6x6()
        # Go to the start of the next row.
        translate(-(6 * (x - 1)), -6)
    # Draw the last row of x patterns (without
    # translation to the bottom left of the next
    # row).
    for j in range(x - 1):
        pattern6x6()
        translate(6, 0)
    pattern6x6()

gsX(gridSizeX); gsY(gridSizeY)
tiling(4, 4)
st()
