# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Exercise 11, page 45.                               *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw the robot, pen up
# Left part of the bottom of the foot
qtr(); fd(); fd()
# Central slit
qtl(); fd(); fd(); fd(); fd(); fd(); qtr(); fd()
qtr(); fd(); fd(); fd(); fd(); fd(); qtl()
# Left part of the bottom of the foot
fd(); fd(); qtl()
# Right side of the foot
fd(); qtl(); fd(); qtr(); fd(); fd(); qtr()
fd(); fd(); qtl()
# Right side of the tip
fd(); qtl(); fd(); qtr(); fd()
qtl(); fd(); qtr(); fd(); qtl(); fd(); qtr(); fd(); qtl()
# Tip
fd()
# Left side of the tip
qtl(); fd(); qtr(); fd(); qtl(); fd()
qtr(); fd(); qtl(); fd(); qtr(); fd(); qtl(); fd()
# Left side of the foot
qtl(); fd(); fd(); qtr(); fd(); fd(); qtr()
fd(); qtl(); fd()
st()
