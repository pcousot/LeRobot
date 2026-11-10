from LibRobot import *

# Draw a square grid as large as the frame

# Reach the edge, straight ahead
def toEdge():
    while not tb():
        fd()

def toNorthEastCorner():
    # Reach the north edge
    pu(); fn(); toEdge()
    # Reach the north-east corner
    fe(); toEdge()

# The robot being at the north edge, go down drawing
# the vertical line then go back up.
def vertical():
    # Turn the robot towards the south
    fs()
    # Go down drawing the vertical line
    pd(); toEdge()
    # Go back up from south to north
    pu(); fn(); toEdge()

# Starting with the robot at the north edge, draw the
# vertical lines from east to west and finish with the
# robot at the north-west corner.
def drawVerticals():
    # Draw the first vertical line in the east
    vertical()
    # Draw the next vertical lines, from east to west
    fw()
    while not tb():
        # Move forward to the west
        fd()
        # Draw the vertical line
        vertical()
        fw()

# The robot being at the west edge, cross drawing the
# horizontal line then cross back to reach the west
# edge.
def horizontal():
    # Turn the robot towards the east
    fe()
    # Cross drawing the horizontal line
    pd(); toEdge(); pu()
    # Cross back from east to west
    fw(); toEdge()

# Starting with the robot at the west edge, draw the
# horizontal lines from north to south and finish with
# the robot at the south-west corner.
def drawHorizontals():
    # Draw the first horizontal line in the north
    horizontal()
    # Draw the next horizontal lines, north to south
    fs()
    while not tb():
        # Move forward to the south
        fd()
        # Draw the horizontal line
        horizontal()
        fs()

toNorthEastCorner()
drawVerticals()
drawHorizontals()
st()
