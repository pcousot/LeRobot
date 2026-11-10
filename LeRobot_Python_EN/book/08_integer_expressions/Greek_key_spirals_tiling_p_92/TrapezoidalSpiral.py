from LibRobot import *

# Draw a trapezoidal spiral
fd(); qtr()
for i in range(1, 10):
    # Draw the top side
    fd()
    # Draw a right side
    etr()
    for j in range(2 * i):
        fd()
    # Draw the bottom side
    tetr()
    for j in range(4 * i + 2):
        fd()
    # Draw a left side
    tetr()
    for j in range(2 * i + 1):
        fd()
    etr()
st()
