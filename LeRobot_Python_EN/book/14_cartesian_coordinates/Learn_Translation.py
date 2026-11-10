from LibRobot import *

# Tutorial: learn to translate rectangles
# located by Cartesian coordinates. The program
# asks you to translate a rectangle by (x, y):
# move the robot with the mouse and click (or
# press the Return key).
maxTries = 5
gridSize = 10
xRect = 9  # Horizontal side of the rectangle
yRect = 3  # Vertical side of the rectangle

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

# Draw a rectangle whose horizontal sides have
# length xRect, whose vertical sides have length
# yRect and whose lower left corner is at the point
# where the robot is.
def drawRectangle():
    fn()
    for i in range(2):
        fdn(yRect)  # Draw a vertical side
        qtr()
        fdn(xRect)  # Draw a horizontal side
        qtr()

# Write the text t in the rectangle and mark its
# lower left corner with a cross
def writeInRectangle(t):
    pu(); fd(); qtr(); fd(); label(t)
    ht(); fd(); qtl(); fd(); ht(); pd()
    cross()

# Draw a rectangle and write n inside it
def rectangle(n):
    drawRectangle()
    writeInRectangle(intToString(n))

# Draw a rectangle and write n:(x,y) inside
# it
def rectangleAndTranslation(n, x, y):
    drawRectangle()
    writeInRectangle(concat([intToString(n), ":(", intToString(x), ",", intToString(y), ")"]))
gs(gridSize); drawAxes()
textStyle(bold)
nbSuccesses = 0
xmouse = 0; ymouse = 0
c = " "
for attempt in range(1, maxTries + 1):
    # Draw at random the coordinates (x, y) of the
    # lower left corner of the rectangle to translate
    # and those (xt, yt) of the translated rectangle,
    # so that the rectangles fit in the
    # frame
    x = atRandom(xmin, xmax - xRect)
    y = atRandom(ymin, ymax - yRect)
    xt = atRandom(xmin, xmax - xRect)
    yt = atRandom(ymin, ymax - yRect)
    # Draw the rectangle to translate
    gc(); translate(x, y); pc(violet)
    rectangleAndTranslation(attempt, xt - x, yt - y)
    # Ask the user to translate it
    message(concat(["Translate the lower left ", "corner of rectangle ", intToString(attempt), " by (", intToString(xt - x), ", ", intToString(yt - y), ");"]))
    xmouse, ymouse, c = interactionTP(True, False, False, True, False)
    if xt - x == xmouse and yt - y == ymouse:
        # Right translation: draw the translated
        # rectangle
        pc(green); rectangle(attempt)
        nbSuccesses += 1
    # Report the error, mark the point pointed at
    # with a small numbered circle and draw the
    # translated rectangle
    else:
        beep(); beep(); beep()
        pc(red); smallCircle()
        pu()
        if x + xmouse + 3 > xmax:
            fw(); fd(); fd()  # Write on the left
        else:
            fe(); fd()  # Write on the right
        pd(); label(intToString(attempt))
        gc(); translate(xt, yt); pc(blue)
        rectangle(attempt)
# Show the results
gc(); translate(2, ymin); pc(black)
tries = intToString(maxTries)
if nbSuccesses == 0:
    label(concat(["No success in ", tries, " tries!"]))
elif nbSuccesses == 1:
    label(concat(["Only one success in ", tries, " tries!"]))
else:
    label(concat([intToString(nbSuccesses), " successes in ", tries, " tries"]))
gc(); st()
