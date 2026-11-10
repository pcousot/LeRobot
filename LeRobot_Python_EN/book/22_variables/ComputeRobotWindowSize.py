from LibRobot import *

# Compute the size of the window where the robot
# moves
width = 0
height = 0

def robotWindowWidth():
    global width
    gs(1); pu(); gc(); gl(); fe(); width = 0
    while not tb():
        width += 1; fd()

def robotWindowHeight():
    global height
    gs(1); pu(); gc(); gb(); fn(); height = 0
    while not tb():
        height += 1; fd()

robotWindowWidth(); robotWindowHeight()
message("(" + str(width) + " x " + str(height) + ")")
markPause()
