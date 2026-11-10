from LibRobot import *

# Draw a Maltese cross
width = 20  # Width of an arm
length = 30  # Length of an arm

# Draw a vertical arm with the robot
# facing north or south
def verticalArm():
    gsX(width); gsY(length)
    cl(); ht(); fd(); fd(); ht(); cl(); qtl()

# Draw a horizontal arm with the robot
# facing east or west
def horizontalArm():
    gsX(length); gsY(width)
    cl(); ht(); fd(); fd(); ht(); cl(); qtl()

def malteseCross():
    for i in range(2):
        verticalArm(); horizontalArm()

malteseCross(); st()
