from LibRobot import *

# Draw a frieze of overlapping diamonds
def diamond():
    gsX(10); gsY(30)
    for j in range(4):
        fd(); qtr()

def frieze():
    gl()
    # Face NE
    etr()
    for k in range(48):
        diamond()
        # Move forward to the middle of the diamond
        etr(); pu(); fd(); pd()
        # Face NE
        etl()

frieze(); st()
