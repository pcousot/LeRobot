from LibRobot import *

# Draw a frieze of interlocking squares
def square():
    for j in range(4):
        fd(); qtr()

def frieze():
    # Face NE
    etr()
    for k in range(41):
        square()
        # Move forward to the middle of the square
        pu(); etr(); fd(); pd()
        # Face NE
        etl()

gl(); frieze(); st()
