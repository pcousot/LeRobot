from LibRobot import *

# Draw a ball
# Draw a ball
for i in range(4):
    # Draw a quarter of the ball
    # Inner half circle
    gs(30); cl(); cl()
    # Quarter circle of the edge
    gs(60); cl()
    # Put the robot back at the centre for the
    # next quarter
    gc()
st()
