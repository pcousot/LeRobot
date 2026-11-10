from LibRobot import *

# Draw regular polygons with 3 to 11 sides
gridSize = 24

# Draw a regular polygon with n >= 1 sides
def polygon(n):
    for i in range(n):
        fd(); rot(360 / n)

for i in range(1, 4):
    for j in range(1, 4):
        gs(gridSize)
        gt(); translate(0, -(i * i - i // 3 + 1))
        gl(); translate(4 * j, 0)
        fe()
        polygon(3 * (i - 1) + j + 2)
st()
