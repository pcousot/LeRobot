from LibRobot import *

# Sierpinski triangles of orders 1 to 4
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        rot(-120)
        segment(n - 1)
        rot(-120)
        segment(n - 1)
        rot(-120)
        pu(); segment(n - 1); pd()
        segment(n - 1)

def triangle(n):
    rot(-30)
    for i in range(3):
        segment(n); rot(-120)

def threeToThePower(n):
    if n <= 0:
        return 1
    else:
        return 3 * threeToThePower(n - 1)

for i in range(1, 5):
    bg(white); gl(); gb()
    gs(162 // threeToThePower(i))
    triangle(i)
    markPause()
st()
