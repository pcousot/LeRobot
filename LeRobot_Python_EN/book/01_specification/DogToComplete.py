# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Drawings to complete, page 7.                       *
# *                                                     *
# *******************************************************
from LibRobot import *

# Drawing of a dog to complete
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

# Memorizing the size of the pen
penSize = 0

def memorizePenSize():
    global penSize
    penSize = valPw()

def restorePenSize():
    pw(penSize)

# Initialization
# Adaptation: in Pascal, gb; the window of the robot being taller,
# the dog would start from the bottom edge; we centre it vertically.
pu(); gs(30); pw(2); dg(); gc(); translate(0, -5)
textFont(times); textSize(9); number = 0; numberE()
# Back profile of the front leg
fdn(2); numberE(); qtr()
# Belly
fdn(3); numberE(); cl(); numberE()
# Hind leg
ht(); fdn(3); numberE(); qtl(); fd(); numberE(); qtl(); fdn(4)
# Tail
fdn(2); numberE(); cr(); numberE(); ht(); cl(); cr(); numberE()
# Back
fdn(3); numberE(); cr(); numberE()
# Head
# Ear
fd(); fd(); numberE(); qtl(); fd(); numberE(); qtl(); fd()
numberE()
# Eye
# pu;
fd(); memorizePenSize(); pw(4); dp(); restorePenSize(); ht()
fd()  # pd;
qtl(); fd(); numberE(); qtl(); fd(); numberE()
# Muzzle
qtr(); fdn(2); numberE(); qtl(); fdn(2); numberE(); qtl()
# Mouth
cl(); numberE(); ht(); cr(); numberW(); ht(); fdn(2); numberE()
cr()
numberE()
# Front profile of the front leg
fdn(3); numberW(); qtl(); fd(); numberW()
st()
