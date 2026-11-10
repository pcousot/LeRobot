from LibRobot import *

# Draw a notched frieze

# Draw the pattern 'n_'
def notch():
    fd(); qtr(); fd(); qtr(); fd(); qtl(); fd()
    qtl()

gl()
for i in range(20):
    notch()
st()
