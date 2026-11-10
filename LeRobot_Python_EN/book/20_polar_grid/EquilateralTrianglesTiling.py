from LibRobot import *

# Tiling of equilateral triangles
sideLength = 13
angle = 60
nbRows = 12
nbColumns = 12

def triangleTipUp():
    fn(); etr(); fd(); qtr(); fd(); tetr(); fdn(2)

def blackTriangleTipUp():
    triangleTipUp(); etl(); paint()

def triangleTipDown():
    fs(); etl(); fd(); qtl(); fd(); tetl(); fdn(2)

def blackTriangleTipDown():
    triangleTipDown(); fdn(-1); qtr(); paint()

def tiling():
    gsRT(sideLength, angle)
    for j in range(1, nbColumns + 1):
        for i in range(1, nbRows // 2 + 1):
            if (i + j) % 2 == 1:
                gt(); gl(); translate(2 * j, -(2 * i))
                blackTriangleTipUp()
                gt(); gl(); translate(2 * j, -(2 * i))
                triangleTipDown()
            else:
                gt(); gl(); translate(2 * j, -(2 * i))
                triangleTipUp()
                gt(); gl(); translate(2 * j, -(2 * i))
                blackTriangleTipDown()

tiling(); st()
