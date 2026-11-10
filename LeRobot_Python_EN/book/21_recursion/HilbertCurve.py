from LibRobot import *

# Hilbert curve of order 6
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

def goToStart():
    pu(); etr(); fdn(8); tetr(); pd()

goToStart()
gs(3)
segmentR(6)
st()
