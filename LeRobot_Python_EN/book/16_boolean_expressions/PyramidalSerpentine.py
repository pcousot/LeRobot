from LibRobot import *

# Draw a pyramidal serpentine
gridSize = 6
height = 28

gs(gridSize); gt(); qtr()
for i in range(1, height + 1):
    fdn(i)
    if i % 2 == 1:
        qtr(); fd(); qtr()
    else:
        qtl(); fd(); qtl()
st()
