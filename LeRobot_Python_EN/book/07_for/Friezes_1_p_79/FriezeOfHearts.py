from LibRobot import *

# Draw a frieze of hearts
gl()
for i in range(10):
    # Draw a pattern made of a mirror S and of an
    # S
    # Mirror S on the left
    cr(); cr(); cr(); cl(); cl(); cl()
    # Go to the mirror S on the right
    pu(); fd(); fd(); qtr(); fd(); fd(); qtl()
    pd()
    # S on the right
    cl(); cl(); cl(); cr(); cr(); cr()
    # Go to the start of the next pattern on the right
    pu(); fd(); fd(); qtr(); fd(); fd(); qtl()
    pd()
st()
