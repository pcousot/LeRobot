from LibRobot import *

# Peano curves
def segmentX(n):
    if n > 0:
        segmentX(n - 1)
        fd()
        segmentY(n - 1)
        fd()
        segmentX(n - 1)
        qtr()
        fd()
        qtr()
        segmentY(n - 1)
        fd()
        segmentX(n - 1)
        fd()
        segmentY(n - 1)
        qtl()
        fd()
        qtl()
        segmentX(n - 1)
        fd()
        segmentY(n - 1)
        fd()
        segmentX(n - 1)

def segmentY(n):
    if n > 0:
        segmentY(n - 1)
        fd()
        segmentX(n - 1)
        fd()
        segmentY(n - 1)
        qtl()
        fd()
        qtl()
        segmentX(n - 1)
        fd()
        segmentY(n - 1)
        fd()
        segmentX(n - 1)
        qtr()
        fd()
        qtr()
        segmentY(n - 1)
        fd()
        segmentX(n - 1)
        fd()
        segmentY(n - 1)

def fourToThePower(n):
    if n <= 0:
        return 1
    else:
        return 4 * fourToThePower(n - 1)

for i in range(1, 5):
    message("Peano curve of order " + intToString(i))
    bg(white); gl(); gb()
    gs(512 / fourToThePower(i))
    segmentX(i)
    markPause()
st()
