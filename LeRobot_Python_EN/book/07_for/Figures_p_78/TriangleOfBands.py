from LibRobot import *

# Draw bands in a triangle
# Draw 10 rectangles of sizes 1, 2,..., 10
# stacked horizontally
ht()
for i in range(1, 11):
    fd(); qtr()
    for j in range(i):
        fd()
    qtr(); fd(); qtr()
    for j in range(i):
        fd()
    pu(); qtl(); fd(); ht(); pd()
st()
