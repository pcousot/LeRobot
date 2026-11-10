from LibRobot import *

# Draw parallelograms on a rectangular
# grid
# Set the size of the grid to 40 x 20.
gsX(40); gsY(20)
# Draw eight parallelograms, turning their bottom
# left corner by an eighth turn around the
# centre of the grid.
for i in range(8):
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    etr()
st()
