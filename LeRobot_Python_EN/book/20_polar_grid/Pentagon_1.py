from LibRobot import *

# Draw a pentagon with gsRT
sideLength = 50

gs(sideLength); qtr(); fd()
gsRT(sideLength, 72); etl(); fd()
gsRT(sideLength, 144); qtl(); fd()
qtl(); fd()
gsRT(sideLength, 72); qtl(); fd()
st()
