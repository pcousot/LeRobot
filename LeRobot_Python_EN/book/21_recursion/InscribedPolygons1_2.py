from LibRobot import *

# Polygons inscribed at the middle of the sides
n = 7
a = 2 * pi / n

def square(x):

    return x * x

def polygon(x):
    if x >= 1:
        fdl(2 * x)
        for i in range(n - 1):
            rot(360 / n); fd()
        rot(360 / n); fdl(x)
        rot(180 / pi * atan(sin(a) / (1 + cos(a))))
        polygon(sqrt(square(x * (1 + cos(a))) + square(x * sin(a))) / 2)

gb(); fe(); polygon(40); st()
