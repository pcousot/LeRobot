from LibRobot import *

# Draw a frieze of squares
def square():
    for j in range(4):
        fd(); qtr()

def frieze():
    for i in range(41):
        square(); fd()

gl(); qtr(); frieze(); st()
