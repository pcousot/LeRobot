from LibRobot import *

# Squares inscribed one inside another

# Draw a square with side m, tilted at 45 degrees,
# around the previous square
def square(m):
    etr(); fdn(m // 2)
    for j in range(4):
        qtr(); fdn(m)

gs(5)
square(1); square(2); square(2); square(4); square(4)
square(8); square(8); square(16); square(16); square(32)
st()
