from LibRobot import *

# Sketch a dog to be completed

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

# Saving the pen size
penSize = 0

def savePenSize():
    global penSize
    penSize = valPw()

def restorePenSize():
    pw(penSize)

# Initialisation (the dog is centred vertically
# in the window)
gc(); translate(0, -8); gs(18); pw(2); dg()
textFont(times); textSize(9); number = 0
numberE()
# Rear outline of the front leg
fdn(2); numberE(); qtr()
# Belly
fdn(3); numberE(); cl(); numberE()
# Hind leg
ht(); fdn(3); numberE(); qtl(); fd()
numberE(); qtl(); fdn(4)
# Tail
fdn(2); numberE(); cr(); numberE(); ht()
cl(); cr(); numberE()
# Back
fdn(3); numberE(); cr(); numberE()
# Head
# Ear
fd(); fd(); numberE(); qtl(); fd()
numberE(); qtl(); fd(); numberE()
# Eye
pu(); fd(); savePenSize(); pw(4); dp()
restorePenSize(); ht()
fd(); pd()
qtl(); fd(); numberE(); qtl(); fd()
numberE()
# Muzzle
qtr(); fdn(2); numberE(); qtl(); fdn(2)
numberE(); qtl()
# Mouth
cl(); numberE(); ht(); cr(); numberW()
ht(); fdn(2); numberE(); cr()
numberE()
# Front outline of the front leg
fdn(3); numberW(); qtl(); fd(); numberW()
st()
