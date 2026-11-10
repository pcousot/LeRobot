from LibRobot import *

# Draw a frame around the drawing

# Reach the edge by moving straight ahead
def toEdge():
    while not tb():
        fd()

def frame():
    # Reach the top edge without drawing anything
    pu(); toEdge()
    # Draw the right half of the top edge
    qtr(); pd(); toEdge()
    # Draw the right edge
    qtr(); toEdge()
    # Draw the bottom edge
    qtr(); toEdge()
    # Draw the left edge
    qtr(); toEdge()
    # Draw the top edge
    qtr(); toEdge()
    # Place the robot at the centre, facing north
    gc(); fn()

frame(); st()
