from LibRobot import *

# Draw an 8 x 8 chessboard

# Draw a white square with side 2, starting from
# the lower left corner and ending at the lower
# right corner, the robot keeping its orientation
# (north or south)
def whiteSquare():
    for i in range(4):
        fdn(2); qtr()
    qtr(); fdn(2); qtl()

# Draw a black square with side 2, starting from
# the lower left corner and ending at the lower
# right corner, the robot keeping its orientation
# (north or south)
def blackSquare():
    whiteSquare()
    # Put the robot in the white square and paint
    # it black
    pu(); etl(); fd(); paint()
    # Go back to the lower right corner
    ht(); fd(); tetl(); pd()

fdn(6)
for i in range(4):
    # Draw an odd row of eight squares,
    # alternately white and black
    for j in range(4):
        whiteSquare(); blackSquare()
    # Turn the robot round to draw an even row
    # from right to left
    ht()
    # Draw an even row of eight squares,
    # alternately white and black
    for j in range(4):
        whiteSquare(); blackSquare()
    # Move the robot down to draw an odd row
    # from left to right
    pu(); fdn(4); ht(); pd()
st()
