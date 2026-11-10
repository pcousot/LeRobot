from LibRobot import *

# Von Koch curves of orders 0 to 5
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        etl()
        segment(n - 1)
        qtr()
        segment(n - 1)
        etl()
        segment(n - 1)

def fourToThePower(n):
    if n <= 0:
        return 1
    else:
        return 4 * fourToThePower(n - 1)

def grid(i):
    gs(500 / fourToThePower(i - 1))

for i in range(1, 7):
    bg(white); gb(); gl(); fe(); grid(i)
    segment(i - 1); markPause()
