from LibRobot import *

# Draw a frieze of arrows and squares
def square():
    for j in range(4):
        fd(); qtr()

def frieze():
    etr()
    for k in range(7):
        # Draw the left arrow
        fd(); ht(); fd(); qtl(); fd(); ht(); fd()
        tetr(); fd(); fd()
        etl(); square(); etr()
        # Cross the rhombus from west to east
        pu(); fd(); fd(); pd()
        # Draw the right arrow
        fd(); fd(); tetl(); fd(); ht(); fd(); qtr()
        fd(); ht(); fd()

gl(); frieze(); st()
