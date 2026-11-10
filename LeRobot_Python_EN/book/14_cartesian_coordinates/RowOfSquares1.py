from LibRobot import *

# Row of squares (moveTo)

# Square of side 1
def square():
    fd(); qtr()
    fd(); qtr()
    fd(); qtr()
    fd(); qtr()

for i in range(1, 11):
    moveTo(i, i)
    square()
st()
