from LibRobot import *

# Draw a frieze of dollars lying down
# Go to the right end of the frieze
pu(); gr(); qtl(); fd(); fd(); qtr(); pd()
for i in range(10):
    # Draw a dollar lying down
    # Arc at the right end of the $
    tetl(); cl(); etl()
    # S-shaped body of the $
    cl(); cl(); cl(); cr(); cr(); cr()
    # Arc at the left end of the $
    etr(); cr(); tetr()
    # Go to the $ on the left
    pu(); qtl(); fd(); fd(); qtr(); pd()
st()
