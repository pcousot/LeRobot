from LibRobot import *

# Draw the curve y = cos x, x between -2 pi and 2 pi

# Draw a straight line up to the border.
def axis():
    while not tb():
        fd()

# Draw 4 axes in the directions N, E, S and W.
def axes():
    for i in range(4):
        gc(); qtr(); axis()

# Graduate the X axis at the points where it meets the
# curve y = cos x.
def graduateX(x):
    if abs(cos(x)) <= 0.00001:
        label(realToString(x))

# Graduate the Y axis.
def graduateY():
    moveTo(0, 1); dc(); label(" 1")
    moveTo(0, -1); dc(); label(" -1")

axes(); gsX(40); gsY(80); graduateY()
moveToReal(-(2 * pi), cos(-(2 * pi)))
graduateX(-(2 * pi))
for x in range(-359, 361):
    drawToReal(x * pi / 180, cos(x * pi / 180))
    graduateX(x * pi / 180)
st()
