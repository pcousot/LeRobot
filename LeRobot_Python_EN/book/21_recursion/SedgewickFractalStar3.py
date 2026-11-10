from LibRobot import *

# Sedgewick's fractal star
noCorner = 0
nW = 1
nE = 2
sE = 3
sW = 4

# Draw a square centred at (x, y) with side length
# 2 * l and missing the corner mC
def squareLastLevel(x, y, l, mC):
    moveTo(x - l, y); pd()
    for i in range(nW, sW + 1):
        if i == mC:
            pu()
        fdn(l); qtr(); fdn(l)
        pd()

# Draw the middle of the sides of a square centred at
# (x, y) with side length 2 * l and missing
# the corner mC
def squareLastButOneLevel(x, y, l, mC):
    moveTo(x - l, y)
    for i in range(nW, sW + 1):
        if i == mC:
            pu()
        else:
            pd()
        fdn(l // 2)
        pu(); fdn(l // 2)
        qtr(); fdn(l // 2)
        if i == mC:
            pu()
        else:
            pd()
        fdn(l // 2)

def square(x, y, l, mC):
    if l // 2 > 0:
        squareLastButOneLevel(x, y, l, mC)
    else:
        squareLastLevel(x, y, l, mC)

def star(x, y, l, mC):
    if l > 0:
        if mC != nW:
            star(x - l, y + l, l // 2, sE)
        if mC != nE:
            star(x + l, y + l, l // 2, sW)
        if mC != sW:
            star(x - l, y - l, l // 2, nE)
        if mC != sE:
            star(x + l, y - l, l // 2, nW)
        square(x, y, l, mC)

gs(3); star(0, 0, 16, noCorner); st()
