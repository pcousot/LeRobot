from LibRobot import *

# Draw the number 888 as on
# digital watches.

# Draw the digit 8, starting at the bottom left of the
# 8 with the robot facing north and ending at the bottom
# left of the 8 with the robot facing west.
def eight():
    fd(); qtr(); fd(); qtl(); fd(); qtl(); fd()
    qtl(); fd(); qtl(); fd(); qtr(); fd(); qtr()
    fd()

# Starting with the robot facing west at the bottom
# left of the 8, back up to the bottom right of the 8 then
# one space and turn the robot north again.
def space():
    pu(); qtr(); qtr(); fd(); fd(); qtl(); pd()

eight(); space()  # the hundreds 8
eight(); space()  # the tens 8
eight()  # the units 8
st()
