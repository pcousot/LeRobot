# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Hopscotch, page 8.                                  *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a hopscotch
def squareSide():
    # Draws the side of a square
    fd(); fd(); fd(); fd(); qtl()

def square():
    # Draws the square
    squareSide(); squareSide(); squareSide(); squareSide()

# Go to the left of the frame
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Draw the earth
fd(); cl(); fd(); fd(); cl(); fd()
# Draw the squares 1, 2, 3
square(); fd(); fd(); fd(); fd(); square(); fd(); fd(); fd(); fd(); square()
fd(); fd(); fd(); fd()
# Draw the square 4
qtr(); fd(); fd(); qtl(); square()
# Draw the square 5
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); qtr(); fd(); fd()
fd(); fd(); qtr(); fd()
fd(); fd(); fd(); fd(); fd()
# Draw the square 6
qtl(); square(); fd(); fd(); fd(); fd()
# Draw the square 7
qtr(); fd(); fd(); qtl(); square()
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); qtr()
# Draw the square 8
fd(); fd(); fd(); fd(); qtr(); fd(); fd(); fd(); fd(); fd(); fd()
# Draw the sky
qtl(); fd(); cl(); fd(); fd(); cl(); fd()
st()
