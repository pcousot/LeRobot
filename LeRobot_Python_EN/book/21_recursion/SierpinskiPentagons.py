from LibRobot import *

# Sierpinski pentagons of orders 1 to 4
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        segment(n - 1)
        rot(-72)
        pu(); segment(n - 1); pd()
        segment(n - 1)

def pentagon(n):
    for i in range(5):
        segment(n - 1)
        rot(-72)

def threeToThePower(n):
    if n <= 0:
        return 1
    else:
        return 3 * threeToThePower(n - 1)

for i in range(1, 5):
    bg(white); gt(); fe()
    gs(324 // threeToThePower(i))
    pentagon(i)
    markPause()
st()
