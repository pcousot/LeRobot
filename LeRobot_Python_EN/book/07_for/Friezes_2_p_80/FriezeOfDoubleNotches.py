from LibRobot import *

# Draw a frieze of double notches

# Draw the pattern 'n_'
def notch():
    fd(); qtr(); fd(); qtr(); fd(); qtl(); fd()
    qtl()

def notchedFrieze():
    for j in range(20):
        notch()

gl()
for i in range(2):
    notchedFrieze()
    # Right end
    fd(); qtr(); fd(); qtr(); fd(); fd()
st()
