from LibRobot import *

# Escher-style tiling of the disc
nc = 8  # Number of concentric circles
nr = 18  # Number of radii over 180 degrees (divisor of 180)
dist = 10  # Distance between two circles, in pixels

gs(dist * nc)
# Draw the radii
for i in range(2 * nr):
    gc(); rot(180 // nr); fd()
# Draw the concentric circles
for i in range(1, nc + 1):
    gc(); fn()
    gs((nc + 1 - i) * dist)
    fd()
    qtl(); cl(); cl(); cl(); cl()
pu()
# Paint
for i in range(1, nc + 1):
    gc(); fn()
    gs((nc + 1 - i) * dist - 3)
    if i % 2 == 1:
        rot(180 // nr)
    for j in range(nr):
        gc(); rot(180 // nr); fd(); qtl()
        paint(); qtr()
        gc(); rot(180 // nr)
st()
