from LibRobot import *

# Polygons inscribed at one third of the sides
n = 7
a = 2 * pi / n

def square(x):

    return x * x

def polygon(x):
    if x >= 1:
        fdl(3 * x)
        for i in range(n - 1):
            rot(360 / n); fd()
        rot(360 / n); fdl(x)
        rot(180 / pi * atan(sin(a) / (2 + cos(a))))
        polygon(sqrt(square(2 * x + x * cos(a)) + square(x * sin(a))) / 3)

gb(); fe(); polygon(26); st()
