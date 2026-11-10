from LibRobot import *

# Draw the grid of all the possible stopping points
# of the robot

# Move straight ahead up to the edge of the frame in
# which the robot moves
def toEdge():
    while not tb():
        fd()

# The robot being at the north edge facing south,
# mark the stopping points on the vertical line, then
# move it east and turn it back to the north, if
# possible.
def verticalNorthSouth():
    dp()
    while not tb():
        fd(); dp()
    qtr()
    if not tb():
        fd(); qtr()

# The robot being at the south edge facing north,
# mark the stopping points on the vertical line, then
# move it east and turn it back to the south, if
# possible.
def verticalSouthNorth():
    dp()
    while not tb():
        fd(); dp()
    qtl()
    if not tb():
        fd(); qtl()

def dg():
    # Reach the north edge
    pu(); toEdge()
    # Reach the north-east corner
    qtr(); toEdge()
    # Turn the robot to the south
    qtr()
    # Mark the vertical lines, from east to west
    while not tb():
        verticalNorthSouth()
        verticalSouthNorth()
    # Put the robot back at the centre facing north
    gc(); fn()

dg(); st()
