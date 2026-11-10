from LibRobot import *

# Sedgewick's fractal star

# Draw a square centred at (x, y) with side length
# 2 * l
def square(x, y, l):
    moveTo(x - l, y - l)
    for i in range(4):
        fdn(2 * l); qtr()

def star(x, y, l):
    if l > 0:
        star(x - l, y + l, l // 2)
        star(x + l, y + l, l // 2)
        star(x - l, y - l, l // 2)
        star(x + l, y - l, l // 2)
        square(x, y, l)

gs(3); star(0, 0, 16)
st()
