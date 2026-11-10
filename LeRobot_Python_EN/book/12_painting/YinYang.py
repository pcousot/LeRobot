from LibRobot import *

# Draw the Chinese Yin Yang symbol
gridSize = 3

def circle():
    cr(); cr(); cr(); cr()

# Lower half circle
gs(6 * gridSize)
qtr(); cl(); cl()
# Upper half circle
gs(6 * gridSize)
cr(); cr()
# Outer circle
gs(12 * gridSize)
circle()
# Small white circle
gs(2 * gridSize)
pu(); qtr(); fdn(2); qtl(); pd(); circle()
# Paint the black area
pu(); qtr(); fdn(4); paint()
# Small black circle
fdn(2); qtl(); pd(); circle(); qtl(); paint()
st()
