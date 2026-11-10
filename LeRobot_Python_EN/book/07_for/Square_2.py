from LibRobot import *

# Draw a square with nested "for" loops
# Draw a square
for i in range(4):
    # Draw one side of the square and turn right
    for j in range(4):
        fd()
    qtr()
st()
