from LibRobot import *

# Horemis's pattern of inscribed squares

# Draw a square with side m, tilted at 45 degrees,
# around the previous square
def square(m):
    etr(); fdn(m // 2)
    for j in range(4):
        qtr(); fdn(m)

# Draw a square with side m and paint the four
# triangles between this square and the previous one
def paintedSquare(m):
    square(m); pu()
    for j in range(4):
        etl(); paint(); tetr(); fdn(m)
    pd()

gs(5)
square(1); paintedSquare(2); square(2); paintedSquare(4)
square(4); paintedSquare(8); square(8); paintedSquare(16)
square(16); paintedSquare(32)
st()
