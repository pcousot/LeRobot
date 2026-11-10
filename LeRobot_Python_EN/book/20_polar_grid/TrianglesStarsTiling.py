from LibRobot import *

# Tiling of triangles and stars
sideLength = 15
nbRows = 5
nbColumns = 6

def cross():
    gsRT(sideLength, 60)
    fne(); fd(); tetl(); fdn(2); tetl(); fdn(2)
    tetr(); fdn(2); tetr(); fd()
    gsRT(sideLength, 30)
    fne(); fd(); tetr(); fdn(2); tetr(); fdn(2)
    tetl(); fdn(2); tetl(); fd()

def tiling():
    for j in range(1, nbColumns + 1):
        for i in range(1, nbRows + 1):
            gsRT(sideLength, 60); gt()
            translate(0, -(2 * i))
            gsRT(sideLength, 30); gl()
            translate(2 * j, 0)
            cross()

def colouring():
    pc(blue)
    for j in range(1, nbColumns):
        for i in range(1, nbRows):
            gsRT(sideLength, 60); gt()
            translate(0, -(2 * i + 1))
            gsRT(sideLength, 30); gl()
            translate(2 * j + 1, 0)
            paint()

tiling(); colouring(); st()
