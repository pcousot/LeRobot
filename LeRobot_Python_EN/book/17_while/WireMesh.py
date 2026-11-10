from LibRobot import *

# Draw a lattice by superimposing two square grids,
# one of which is turned by an eighth turn

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
    toNorthEastCorner()
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

def toNorthWestCorner():
    # Reach the north edge
    pu(); fn(); toEdge()
    # Reach the north-west corner
    fw(); toEdge()

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
    toNorthWestCorner()
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

def toSouthWestCorner():
    # Reach the south edge
    pu(); fs(); toEdge()
    # Reach the south-west corner
    fw(); toEdge()

# Starting from the west or north edge, draw the oblique
# line from north-west to south-east and come back to
# the starting edge.
def obliqueNWSE():
    # Draw the oblique line
    fse(); pd(); toEdge()
    # Come back
    fnw(); pu(); toEdge()

def drawObliquesNWSE():
    toSouthWestCorner()
    # Draw the NW-SE oblique lines from the west edge
    fn()
    while not tb():
        fd()
        obliqueNWSE()
        fn()
    # Draw the NW-SE oblique lines from the north edge
    fe()
    while not tb():
        fd()
        obliqueNWSE()
        fe()

def toSouthEastCorner():
    # Reach the south edge
    pu(); fs(); toEdge()
    # Reach the south-east corner
    fe(); toEdge()

# Starting from the south or west edge, draw the oblique
# line from south-west to north-east and come back to
# the starting edge.
def obliqueSWNE():
    # Draw the oblique line
    fne(); pd(); toEdge()
    # Come back
    fsw(); pu(); toEdge()

def drawObliquesSWNE():
    toSouthEastCorner()
    # Draw the SW-NE oblique lines from the south edge
    fw()
    while not tb():
        fd()
        obliqueSWNE()
        fw()
    # Draw the SW-NE oblique lines from the west edge
    fn()
    while not tb():
        fd()
        obliqueSWNE()
        fn()

drawVerticals()
drawHorizontals()
drawObliquesNWSE()
drawObliquesSWNE()
st()
