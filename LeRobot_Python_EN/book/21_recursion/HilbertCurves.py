from LibRobot import *

# Hilbert curves of orders 1 to 6
def segmentL(n):
    if n > 0:
        qtl()
        segmentR(n - 1)
        fd()
        qtr()
        segmentL(n - 1)
        fd()
        segmentL(n - 1)
        qtr()
        fd()
        segmentR(n - 1)
        qtl()

def segmentR(n):
    if n > 0:
        qtr()
        segmentL(n - 1)
        fd()
        qtl()
        segmentR(n - 1)
        fd()
        segmentR(n - 1)
        qtl()
        fd()
        segmentL(n - 1)
        qtr()

def twoToThePower(n):
    if n <= 0:
        return 1
    else:
        return 2 * twoToThePower(n - 1)

for i in range(1, 7):
    message("Hilbert curve of order " + intToString(i))
    bg(white); gb(); gl()
    gs(256 // twoToThePower(i)); segmentR(i)
    markPause()
st()
