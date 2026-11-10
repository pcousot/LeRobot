from LibRobot import *

# Tiling of quadrilaterals produced by a pattern
# inscribed in a (6 x 6) square
gridSizeX = 6
gridSizeY = 6
patternX = 6  # Width of the pattern
patternY = 6  # Height of the pattern

# Draw a pattern in a (patternX x patternY) square,
# the robot starting and ending at the centre of
# the pattern, facing north.
def pattern():
    for i in range(4):
        pu(); qtl(); fd(); pd()
        tetr(); fd(); fd(); qtl(); fd(); ht(); fd()
        etl(); fd(); fd(); ht(); fd(); qtr(); fd()
        qtr(); fd()
        pu(); tetr(); fd(); fd(); fd(); pd()
        etr()

# Tile with y rows of x patterns
def tiling(x, y):
    # Shift the drawing to the left by half the
    # length of a row and upwards by
    # half the height of the tiling.
    translate(-(patternX * (x // 2)), patternY * (y // 2))
    # Draw (y - 1) rows of x patterns (with
    # translation to the bottom left of the next
    # row).
    for i in range(y - 1):
        # Draw a row of x patterns (without
        # translation to the right after the last pattern
        # of the row).
        for j in range(x - 1):
            pattern()
            # Move to the next pattern on the right in the
            # same row.
            translate(patternX, 0)
        pattern()
        # Go to the start of the next row.
        translate(-(patternX * (x - 1)), -patternY)
    # Draw the last row of x patterns (without
    # translation to the bottom left of the next
    # row).
    for j in range(x - 1):
        pattern()
        translate(patternX, 0)
    pattern()

gsX(gridSizeX); gsY(gridSizeY)
tiling(10, 6)
st()
