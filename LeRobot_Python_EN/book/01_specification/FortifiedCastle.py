# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Fortified castle, page 6.                           *
# *                                                     *
# *******************************************************
from LibRobot import *

def tower():
    # Draw a tower starting from the bottom left
    # Draw the left edge
    pd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
    fd()
    # Draw the battlements of the tower
    qtl(); fd(); qtr(); fd(); fd(); qtr(); fd(); qtr(); fd(); qtl(); fd()
    qtl(); fd(); qtr(); fd(); qtr(); fd(); qtl(); fd()
    qtl(); fd(); qtr(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd(); fd()
    fd()
    # Draw the window
    ht(); fd(); qtr(); pu(); fd(); pd(); fd(); fd(); qtl(); fd(); qtl(); fd()
    fd(); qtl(); fd(); qtr(); pu(); fd(); pd()
    qtr(); fd(); fd()
    # Draw the right edge
    qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
    fd(); fd()
    # Draw the bottom
    qtr(); fd(); fd(); fd()

def battlement():
    # Draws a battlement and a machicolation
    fd(); qtl(); fd(); qtr(); fd(); qtr(); fd(); pu(); fd(); pd(); fd(); ht()
    fd(); pu(); fd(); qtr(); pd()

# Move the robot without drawing to the bottom left corner of the frame
# Go down
pu(); ht(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Go left
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); fd(); fd(); qtr()
tower()
# Draw the battlements of the wall
# Go to the 1st battlement on the left
ht(); fd(); fd(); fd(); qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); qtr()
battlement(); battlement(); battlement(); battlement()
# Keep
# Left side
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Roof
etr(); fd(); fd(); fd(); fd(); qtr(); fd(); fd(); fd(); fd(); etr()
qtr(); fd(); fd(); fd(); fd(); qtl(); pu(); fd(); pd()
fd(); pu(); fd(); fd(); pd(); fd(); ht(); pu(); fd(); fd(); fd(); fd()
fd(); qtl(); pd(); fd(); fd(); fd(); fd(); ht(); fd(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); qtr()
# Right side
fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Go to the third battlement
pu(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); ht(); pd()
battlement(); battlement(); battlement(); battlement(); battlement(); battlement(); battlement()
battlement()
# Go down to the foot of the tower
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); ht()
tower()
# Draw the ground to the right of the drawbridge
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); qtr()
# Draw the drawbridge
# Draw the outline
fd(); fd(); fd(); etl(); fd(); fd(); qtl(); fd(); fd(); etl(); fd(); fd()
fd(); qtl()
fd(); fd(); fd(); fd(); qtl(); fd(); fd(); fd(); qtl(); fd(); fd(); fd()
fd()
# Draw the portcullis
etl(); qtl(); fd(); fd(); fd(); qtl(); fd(); qtl(); fd(); fd(); qtl()
fd(); fd(); qtl()
fd(); qtl(); fd(); fd(); fd(); etr(); qtr(); fd(); qtr(); fd(); fd()
fd(); fd(); qtl(); fd()
qtl(); fd(); fd(); fd(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
fd(); fd(); qtl(); fd()
qtl(); fd(); fd(); fd(); qtr(); fd(); qtr(); fd(); fd(); fd(); qtl()
fd(); qtl(); fd(); fd()
fd(); qtr()
# Draw the ground to the left of the drawbridge
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
st()
# Robot
