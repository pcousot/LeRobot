from LibRobot import *

# Draw a four-bladed propeller in colour
gridSize = 18
edgeThickness = 2

def leftHalfCircle(r):
    gs(r); cl(); cl()

def rightHalfCircle(r):
    gs(r); cr(); cr()

def blade(c):
    # Draw the outline of the blade
    pw(edgeThickness); pc(black)
    leftHalfCircle(gridSize)
    rightHalfCircle(gridSize)
    rightHalfCircle(2 * gridSize)
    # Paint the inside of the blade
    qtr(); gs(gridSize)
    pu(); fdn(3); pc(c); paint(); fdn(-3); pd()

def propeller():
    blade(blue); blade(indigo); blade(violet); blade(red)

propeller(); st()
