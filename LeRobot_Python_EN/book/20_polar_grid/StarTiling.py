from LibRobot import *

# Tiling of the plane with stars and hexagons
gridSize = 9
rowLength = 6
nbRows = 6
n = 8  # Number of points of the star, a multiple of 4
alpha = 30  # 0 < alpha < ((n - 2) * 180) / n

def quarterOfStar():
    for i in range(n // 4):
        fd(); ht()
        rot(2 * (n - 1) * 180 / n - alpha)
        fd(); ht(); rot(alpha)

def star():
    for i in range(4):
        quarterOfStar()

def nextStarEast():
    pu()
    for i in range(2):
        quarterOfStar()
    ht(); pd()

def nextStarSouth():
    pu()
    for j in range(2):
        ht(); quarterOfStar()
    pd()

def row():
    gs(1); gl(); gs(gridSize); fe()
    rot(alpha / 2)
    for c in range(rowLength):
        star(); nextStarEast()
    nextStarSouth()

def atTheTop():
    pu(); gs(1); gt(); gs(gridSize); fs()
    rot(alpha / 2)
    quarterOfStar(); pd()

def tiling():
    atTheTop()
    for l in range(nbRows):
        row()

tiling(); st()
