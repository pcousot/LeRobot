from LibRobot import *

# Rhombic rings, every other one painted
nbSquares = 7  # Number of squares (assumed odd)

etr()
# Draw a point (square with side zero)
dp()
for i in range(1, nbSquares + 1):
    # Place the robot at the starting point of the
    # drawing of the next square
    tetl(); pu(); fd(); tetr(); pd()
    # Draw a square with side i, the robot starting
    # and ending at the lower left corner, facing
    # north-west
    for j in range(4):
        fdn(i); qtr()
# Paint every other ring
gc(); etl(); pu()
for i in range(nbSquares // 2):
    fd(); paint(); fd()
# Paint the last ring of odd rank
fd(); paint()
st()
