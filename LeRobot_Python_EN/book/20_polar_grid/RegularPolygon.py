from LibRobot import *

# Draw a regular polygon
gridSize = 30
nbSides = 7

# Draw a regular polygon with n >= 1 sides
def polygon(n):
    for i in range(n):
        fd(); rot(360 / n)

gs(gridSize); polygon(nbSides); st()
