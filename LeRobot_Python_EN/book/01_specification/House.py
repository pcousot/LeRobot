# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * House, page 9.                                      *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a house
# Go down without drawing
pu(); qtr(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); qtr(); qtr()
pd()
# Left wall of the house
fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Roof of the house
# Left slope
etr(); fd(); fd(); fd(); fd(); fd()
# Right slope
qtr(); fd(); fd(); fd(); fd(); fd()
# Underside of the roof
tetr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Cross back to the right without drawing
pu(); qtr(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); pd()
# Right wall
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Ground
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Go up to the window without drawing
pu(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); qtr(); fd(); pd()
# Window
# Edge
fd(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd()
qtr()
# Panes
fd(); qtr(); fd(); fd()
pu(); qtr(); fd(); qtr(); fd(); pd()
qtr(); fd(); fd()
# Go to the door without drawing
pu(); fd(); qtr(); fd(); qtl(); fd(); pd()
# Door
fd(); fd(); fd(); qtr()
fd(); fd(); fd(); fd(); qtr()
fd(); fd(); fd(); qtr()
fd(); fd()
# Latch
qtr(); fd(); qtr(); qtr(); fd(); qtr()
fd(); fd()
# Go to the chimney without drawing
pu(); fd(); fd(); fd(); fd(); fd(); fd(); qtr(); fd(); fd(); pd()
# Chimney
qtl(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd(); fd()
# Go to the top of the chimney without drawing
qtr(); qtr(); fd(); fd(); fd(); qtl(); fd()
# Smoke
qtr(); cr(); cl(); cr()
# Stop the robot
st()
