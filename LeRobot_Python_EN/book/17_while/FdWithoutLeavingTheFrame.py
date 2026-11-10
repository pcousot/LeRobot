from LibRobot import *

# Move forward without ever leaving the frame

# Move forward if it keeps the robot inside the frame
def fdWithoutLeaving():
    if not tb():
        fd()

for i in range(1025):
    fdWithoutLeaving()
st()
