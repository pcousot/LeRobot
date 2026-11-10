from LibRobot import *

# Sierpinski curves of orders 0 to 5
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

def gridSize(n):
    if n == 5:
        return 2
    else:
        return 2 * gridSize(n + 1)

for order in range(6):
    bg(white)
    message("Sierpinski curve of order " + str(order))
    gt(); gl(); gs(gridSize(order))
    fe(); pu(); fd(); pd(); fn()
    sierpinskiCurve(order)
    markPause()
