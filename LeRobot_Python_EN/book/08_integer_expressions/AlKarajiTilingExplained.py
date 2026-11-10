from LibRobot import *

# Tiling of Al-Karaji explained: the even L-shapes
# are painted and the border is graduated (figure of
# the book)
nmax = 10

# Graduate the four sides of the large square
def markTheBorder(n):
    l = valGsX()
    m = (n + 1) // 2 * n if n % 2 == 1 else (n + 1) * (n // 2)
    for i in range(4):
        for j in range(m):
            gs(2); qtr(); fd(); ht(); fd(); qtr()
            gs(l); fd()
        gs(2); qtr(); fd(); ht(); fd(); qtr()
        gs(l); qtl()

# Number the L-shapes from 1 to n
def numberLShapes(n):
    textFont(courier); textSize(9)
    for k in range(1, n + 1):
        for l in range(k // 2):
            fd()
        translate(0, -4); label(intToString(k))
        translate(0, 4)
        for l in range(k - k // 2):
            fd()

gb(); gl(); pu(); fd(); qtr(); fd(); qtl()
pd(); gs(3)
for i in range(1, nmax + 1):
    # Draw a square with side length
    # 1 + 2 + ... + i
    for j in range(4):
        for k in range(1, i + 1):
            for l in range(k):
                fd()
        qtr()
# Paint
translate(1, 1)
for i in range(2, nmax + 1):
    fdn(i); qtr(); fdn(i); qtr()
    fdn(i); qtr(); fdn(i); qtr()
    if i % 2 == 0:
        etl(); pc(yellow); paint(); ht(); paint()
        pc(violet); qtr(); paint(); tetr(); pc(black)
    translate(i, i)
# Back to the bottom left
for i in range(1, nmax + 1):
    translate(-i, -i)
qtr(); markTheBorder(nmax); numberLShapes(nmax); st()
