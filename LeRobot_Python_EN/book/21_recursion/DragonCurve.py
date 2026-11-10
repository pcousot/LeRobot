from LibRobot import *

# Dragon curve of order 12
def segmentRight(n):
    if n == 0:
        fd()
    elif n > 0:
        segmentRight(n - 1)
        qtl()
        segmentLeft(n - 1)

def segmentLeft(n):
    if n == 0:
        fd()
    elif n > 0:
        segmentRight(n - 1)
        qtr()
        segmentLeft(n - 1)

gs(2); fe(); segmentRight(12); st()
