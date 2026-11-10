from LibRobot import *

# Sierpinski curve of order 5
gridSize = 1
order = 5

def a(k):
    if k > 0:
        a(k - 1); face(southEast); fd()
        b(k - 1); face(east); fdn(2)
        d(k - 1); face(northEast); fd()
        a(k - 1)

def b(k):
    if k > 0:
        b(k - 1); face(southWest); fd()
        c(k - 1); face(south); fdn(2)
        a(k - 1); face(southEast); fd()
        b(k - 1)

def c(k):
    if k > 0:
        c(k - 1); face(northWest); fd()
        d(k - 1); face(west); fdn(2)
        b(k - 1); face(southWest); fd()
        c(k - 1)

def d(k):
    if k > 0:
        d(k - 1); face(northEast); fd()
        a(k - 1); face(north); fdn(2)
        c(k - 1); face(northWest); fd()
        d(k - 1)

def sierpinskiCurve(i):
    a(i); face(southEast); fd()
    b(i); face(southWest); fd()
    c(i); face(northWest); fd()
    d(i); face(northEast); fd()

gt(); gl(); gs(gridSize); fe(); pu(); fd()
pd(); fn()
sierpinskiCurve(order); st()
