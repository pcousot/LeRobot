from LibRobot import *

# Frieze of S's lying down
# Go to the starting point of the frieze of S's
# lying down
pu(); gl(); qtr(); fd(); fd(); fd(); qtr()
pd()
for i in range(5):
    # S lying down on the left
    for j in range(2):
        cr(); cr(); cr(); etr(); cr()
        pu(); tetl(); fd(); qtl(); pd()
    pu(); qtl(); fd(); fd(); fd(); fd(); qtl()
    pd()
    # Mirror S lying down on the right
    for j in range(2):
        cl(); cl(); cl(); etl(); cl()
        pu(); tetr(); fd(); qtr(); pd()
    # Go to the starting point of the next pair
    # of S's lying down
    pu(); qtr(); fd(); fd(); fd(); fd(); qtr()
    pd()
st()
