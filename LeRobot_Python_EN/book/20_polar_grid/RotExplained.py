from LibRobot import *

# Figure explaining the command rot: the grid square
# after successive rotations of 15 degrees
sideLength = 30
n = 24
dx = 70
dy = 40
nbH = 5
borderX = 40
plusY = 10

def dottedLine(n):
    pu()
    for i in range(1, n + 1):
        if i % 2 == 1:
            dp()
        fd()
    dp(); pd()

# Put the robot at the position of the i-th diagram
def position(i):
    gs(1); gt(); gl(); translate(borderX, 0)
    translate(dx * (i % nbH), -(dy * (i // nbH + 1)))
    if i // nbH == 2:
        translate(0, plusY)
    if i // nbH == 4:
        translate(0, -plusY)

# Draw the grid square (0, 0) - (1, 1) of x by y pixels
# in the i-th diagram, then put the robot there at the
# end of the segment, with orientation o
def gridSquare(i, x, y, o):
    position(i); gs(1); fe()
    dottedLine(round(x)); qtl()
    dottedLine(round(y)); qtl()
    dottedLine(round(x)); qtl()
    dottedLine(round(y)); qtl()
    gsX(x); gsY(y)
    if o == 0:
        fn(); moveTo(0, 1)
    elif o == 1:
        fne(); moveTo(1, 1)
    elif o == 2:
        fe(); moveTo(1, 0)
    elif o == 3:
        fse(); moveTo(1, -1)
    elif o == 4:
        fs(); moveTo(0, -1)
    elif o == 5:
        fsw(); moveTo(-1, -1)
    elif o == 6:
        fw(); moveTo(-1, 0)
    else:
        fnw(); moveTo(-1, 1)

def coordFrame(i):
    gridSquare(i, valGsX(), valGsY(), valOrientation())

message("gs(30); fe(); fd()")
position(0); gs(sideLength); fe(); fd(); coordFrame(0)
for i in range(1, n + 1):
    message("gs(30); fe(); rot(" + intToString(i * (360 // n)) + "); fd()")
    position(i); gs(sideLength); fe()
    rot(i * (360 // n))
    fd(); coordFrame(i)
st()
