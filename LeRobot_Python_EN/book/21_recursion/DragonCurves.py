from LibRobot import *

# Dragon curves of orders 1, 2, 4, ..., 12
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

def grid(i):
    message("Dragon curve of order " + intToString(i))
    if i <= 6:
        gs(12)
    elif i <= 8:
        gs(6)
    elif i <= 10:
        gs(3)
    else:
        gs(2)

fe(); grid(1); segmentRight(1); markPause()
for i in range(1, 7):
    bg(white); fe(); grid(2 * i); segmentRight(2 * i)
    markPause()
st()
