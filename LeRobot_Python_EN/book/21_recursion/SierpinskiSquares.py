from LibRobot import *

# Sierpinski squares of orders 1 to 4
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        segment(n - 1)
        qtr()
        pu(); segment(n - 1); pd()
        segment(n - 1)

def square(n):
    for i in range(4):
        segment(n); qtr()

def threeToThePower(n):
    if n <= 0:
        return 1
    else:
        return 3 * threeToThePower(n - 1)

for i in range(1, 5):
    bg(white); gl(); gb()
    gs(162 // threeToThePower(i)); square(i)
    markPause()
