from LibRobot import *

# Row of squares (translate)

# Square of side 1
def square():
    fd(); qtr()
    fd(); qtr()
    fd(); qtr()
    fd(); qtr()

for i in range(10):
    translate(1, 1)
    square()
st()
