from LibRobot import *

# Tiling of the plane with hexagons
rowLength = 8
nbRows = 9

def hexagon():
    for i in range(5):
        fd(); rot(-60)
    fd(); translate(2, 0); rot(-60)

def row(l):
    for c in range(rowLength):
        hexagon()
    rot(-60)
    if l % 2 == 1:
        translate(-(2 * rowLength) + 1, -1)
    else:
        translate(-(2 * rowLength) - 1, -1)
    rot(60); translate(0, -1)

def tiling():
    for l in range(1, nbRows + 1):
        row(l)

gt(); gl(); translate(0, -2); tiling(); st()
