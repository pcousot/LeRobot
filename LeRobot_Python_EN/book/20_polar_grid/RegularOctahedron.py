from LibRobot import *

# Draw the net of a regular octahedron
side = 25

def triangle():
    gsRT(side, 60); etr(); fd(); qtr(); fd()
    tetr(); fd(); fd()
    ht(); fd(); fd(); qtl()

# Bottom left triangle
ht(); triangle(); ht()
# Row of three triangles pointing up
for i in range(3):
    triangle()
# Complete the three triangles pointing down
etr(); fd(); tetl(); fdn(6)
# Top right triangle
ht(); fdn(4); qtl(); triangle()
st()
