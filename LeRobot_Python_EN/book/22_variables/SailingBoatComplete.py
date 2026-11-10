from LibRobot import *

# Sketch a sailing boat to be completed

# Saving the robot's current direction
currentOrientation = 0

# Save the robot's current direction in
# currentOrientation
def saveDirection():
    global currentOrientation
    currentOrientation = valOrientation()

# Turn the robot to the direction saved in
# currentOrientation
def restoreDirection():
    face(currentOrientation)

# Saving the grid size
horizontalSize = 0
verticalSize = 0

def saveGridSize():
    global horizontalSize, verticalSize
    horizontalSize = valGsX()
    verticalSize = valGsY()

def restoreGridSize():
    gsX(horizontalSize)
    gsY(verticalSize)

# Saving the position of the pen
penIsDown = False

def savePenPosition():
    global penIsDown
    penIsDown = valPd()

def restorePenPosition():
    if penIsDown:
        pd()
    else:
        pu()

# Number of the robot's current position
number = 0

# Mark the robot's current position with a cross and
# number it on the east side with the value of number,
# which is incremented, without changing the position
# and the orientation of the robot
def numberE():
    global number
    dc()
    saveDirection(); saveGridSize()
    savePenPosition()
    gs(valPw() + 3); fe(); pu(); fd()
    label(str(number))
    ht(); fd()
    restoreDirection(); restoreGridSize()
    restorePenPosition()
    number += 1

# Mark the robot's current position with a cross and
# number it on the west side with the value of number,
# which is incremented, without changing the position
# and the orientation of the robot
def numberW():
    global number
    dc()
    saveDirection(); saveGridSize()
    savePenPosition()
    gs(valPw() + 10); fw(); pu()
    fd(); label(str(number))
    ht(); fd()
    restoreDirection(); restoreGridSize()
    restorePenPosition()
    number += 1

# Initialisation
gs(12); pw(2); dg()
textFont(times); textSize(9); number = 0
# Move the robot down without drawing anything
pu(); ht(); fdn(10); numberE(); qtl()
# Draw the stern of the boat
# Draw the rear waterline
pd(); fdn(9); numberE()
# Draw the rear of the hull
etl(); fdn(4); numberE()
# Draw the afterdeck
qtl(); etl(); fdn(13); numberE()
# Draw the mast
qtr(); fdn(16); numberE()
# Draw the flag
qtr(); fdn(4); numberE(); qtr(); fdn(2)
numberE(); qtr(); fdn(4)
numberE(); qtl(); fd(); numberE()
# Draw the mainsail
etl(); fdn(12); numberE()
qtr(); etr(); fdn(12)
# Draw the jib
fdn(9); numberE(); qtr(); etr()
fdn(9); numberE(); qtr(); etr()
fdn(10); numberW(); qtr()
# Draw the bow of the boat
# Draw the foredeck
fdn(10); numberE()
# Draw the front of the hull
ht(); etr(); fdn(4); numberE()
# Draw the front waterline
etl(); fdn(6); numberW()
st()
