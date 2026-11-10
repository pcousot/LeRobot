from LibRobot import *

# Tutorial: learn to locate the points of the
# plane by their Cartesian coordinates.
# The program asks you to point at a point (x, y):
# move the robot with the mouse and click
# (or press the Return key).
maxTries = 5
gridSize = 10

# Extreme coordinates of the points of the frame,
# found by drawing the axes
xmin = 0
xmax = 0
ymin = 0
ymax = 0

# Write the number n beside the axis that the robot
# is drawing
def writeNumber(n):
    pu()
    if te():
        qtr(); fd(); label(intToString(n))
        ht(); fd(); qtr()
    elif tn():
        qtl(); fdn(2); label(intToString(n))
        ht(); fdn(2); qtl()
    elif tw():
        qtl(); fd(); label(intToString(n))
        ht(); fd(); qtl()
    elif ts():
        qtr(); fdn(2); label(intToString(n))
        ht(); fdn(2); qtr()
    pd()

# Draw a graduated axis from the origin to the
# edge of the frame; the result is the coordinate
# of the last point of the axis
def drawAnAxis(increment):
    bound = 0
    while not tb():
        if bound != 0 and bound % 5 == 0:
            writeNumber(bound); pc(indigo)
        else:
            pc(red)
        dc(); pc(black); fd(); bound += increment
    return bound

def drawAxes():
    global xmin, xmax, ymin, ymax
    gc(); fe(); gs(3); fd(); gs(gridSize)
    writeNumber(0)
    # x-axis
    gc(); fe(); xmax = drawAnAxis(1)
    translate(-1, 1); label("X")
    gc(); fw(); xmin = drawAnAxis(-1)
    # y-axis
    gc(); fn(); ymax = drawAnAxis(1)
    translate(1, -1); label("Y")
    gc(); fs(); ymin = drawAnAxis(-1)
    fn(); pc(red); dg(); pc(black)
    allowExits()

def smallCircle():
    gs(2); cl(); cl(); cl(); cl(); gs(gridSize)

def cross():
    pw(3); dc(); pw(1)

# Draw a number at random between a and b
def atRandom(a, b):
    return a + randrange(b - a + 1)
gs(gridSize); drawAxes()
textStyle(bold)
nbSuccesses = 0
xmouse = 0; ymouse = 0
c = " "
for attempt in range(maxTries):
    # Draw at random the coordinates of the point
    # (x, y) to point at
    x = atRandom(xmin, xmax)
    y = atRandom(ymin, ymax)
    # Ask the user to point at the point
    gc()
    message(concat(["Locate the point (", intToString(x), ", ", intToString(y), ");"]))
    xmouse, ymouse, c = interactionTP(True, False, False, True, False)
    if x == xmouse and y == ymouse:
        # The requested point has been pointed at:
        # mark it with a cross
        pc(green); cross()
        nbSuccesses += 1
    # Report the error, mark the point pointed at
    # with a small circle and the requested point
    # with a cross
    else:
        beep(); beep(); beep()
        pc(red); smallCircle()
        gc(); translate(x, y); pc(blue); cross()
pc(black)
# Show the results
gc(); translate(2, ymin)
tries = intToString(maxTries)
if nbSuccesses == 0:
    message(concat(["No success in ", tries, " tries!"]))
elif nbSuccesses == 1:
    message(concat(["Only one success in ", tries, " tries!"]))
else:
    message(concat([intToString(nbSuccesses), " successes in ", tries, " tries"]))
gc(); markPause()
