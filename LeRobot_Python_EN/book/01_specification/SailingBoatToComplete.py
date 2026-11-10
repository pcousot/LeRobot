# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Drawings to complete, page 7.                       *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a sailing boat to complete
# Memorizing the current direction of the robot
currentOrientation = 0

def memorizeDirection():
    global currentOrientation
    # Memorize the current direction of the robot in 'currentOrientation'
    currentOrientation = valOrientation()

def restoreDirection():
    # Put the robot in the direction memorized in 'currentOrientation'
    face(currentOrientation)

# Memorizing the size of the grid
horizontalSize = 0
verticalSize = 0

def memorizeGridSize():
    global horizontalSize, verticalSize
    horizontalSize = valGsX()
    verticalSize = valGsY()

def restoreGridSize():
    gsX(horizontalSize)
    gsY(verticalSize)

# Memorizing the position of the pen
penIsDown = False

def memorizePenPosition():
    global penIsDown
    penIsDown = valPd()

def restorePenPosition():
    if penIsDown:
        pd()
    else:
        pu()

# Memorize the number of the current position of the robot
number = 0

def numberE():
    global number
    # Mark the current position of the robot with a cross, number it
    # to the east with the value of 'number', which is incremented,
    # without changing the position and orientation of the robot.
    dc()
    memorizeDirection(); memorizeGridSize(); memorizePenPosition()
    gs(valPw() + 3); fe(); pu(); fd(); label(intToString(number))
    ht(); fd()
    restoreDirection(); restoreGridSize(); restorePenPosition()
    number += 1

def numberW():
    global number
    # Mark the current position of the robot with a cross, number it
    # to the west with the value of 'number', which is incremented,
    # without changing the position and orientation of the robot.
    dc()
    memorizeDirection(); memorizeGridSize(); memorizePenPosition()
    gs(valPw() + 10); fw(); pu(); fd(); label(intToString(number))
    ht(); fd()
    restoreDirection(); restoreGridSize(); restorePenPosition()
    number += 1

# Initialization
gs(12); pw(2); dg()
textFont(times); textSize(9); number = 0
# Move the robot down without drawing anything
pu(); ht(); fdn(10); numberE(); qtl()
# Draw the back of the hull
# Draw the rear waterline
# pd;
fdn(9); numberE()
# Draw the back of the hull
etl(); fdn(4); numberE()
# Draw the rear deck
qtl(); etl(); fdn(13); numberE()
# Draw the mast
qtr(); fdn(16); numberE()
# Draw the flag
qtr(); fdn(4); numberE(); qtr(); fdn(2); numberE(); qtr(); fdn(4)
numberE(); qtl(); fd(); numberE()
# Draw the mainsail
etl(); fdn(12); numberE()
qtr(); etr(); fdn(12)
# Draw the jib
fdn(9); numberE(); qtr(); etr()
fdn(9); numberE(); qtr(); etr()
fdn(10); numberW(); qtr()
# Draw the front of the boat
# Draw the front deck
fdn(10); numberE()
# Draw the front of the hull
ht(); etr(); fdn(4); numberE()
# Draw the front waterline
etl(); fdn(6); numberW()
st()
