from LibRobot import *

# Steps in painting a drawing: draw the outline of
# the Yin Yang and paint the area on the right
gridSize = 24

gs(gridSize)
# Lower half circle
qtr(); cl(); cl()
# Upper half circle
cr(); cr()
# Outer circle
gs(2 * gridSize)
cr(); cr(); cr(); cr()
# Paint
qtl(); paint()
st()
