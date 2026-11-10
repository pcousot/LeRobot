from LibRobot import *

# Draw a rosette of hexagons
l = 30  # Length of a segment

def hexagon():
    fdl(l)
    for i in range(6):
        rot(60); fd()

def rosette():
    for i in range(12):
        hexagon(); rot(30)

rosette(); st()
