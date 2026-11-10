from LibRobot import *

# Draw six Maltese crosses of different widths and
# lengths
spacing = 10  # Pixels between two crosses

def verticalArm(length, width):
    gsX(width); gsY(length)
    cl(); ht(); fd(); fd(); ht(); cl(); qtl()

def horizontalArm(length, width):
    gsX(length); gsY(width)
    cl(); ht(); fd(); fd(); ht(); cl(); qtl()

def malteseCross(width, length):
    # Starting from the west edge of the cross, shift
    # the robot to the right, to the centre of the cross
    gs(1); pu(); qtr(); fdn(length); qtl(); pd()
    # Draw the four-armed Maltese cross
    for i in range(2):
        verticalArm(length, width)
        horizontalArm(length, width)
    # Shift the robot to the right, east of the cross
    gs(1); pu(); qtr(); fdn(length + spacing)
    qtl(); pd()

gl()
malteseCross(10, 15); malteseCross(15, 20)
malteseCross(20, 25); malteseCross(25, 30)
malteseCross(10, 35); malteseCross(35, 35)
st()
