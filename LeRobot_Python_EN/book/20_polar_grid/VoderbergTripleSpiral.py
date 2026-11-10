from LibRobot import *

# Tiling of the plane with three spirals
# made of Voderberg tiles
gridSize = 6
length = 3  # Number of thirds of rings making up a spiral
theta = 15

# Draw a Voderberg tile starting from the tip
def tileFromTip():
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(7 * theta)
    fd(); ht(); rot(4 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht()

# Draw a Voderberg tile starting from the base
def tileFromBase():
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(4 * theta)
    fd(); fdn(-1); rot(-(4 * theta))

def segment(n):
    for i in range(4):
        tileFromTip()
        for j in range(n):
            tileFromBase(); tileFromTip()

def bend(n):
    for i in range(4):
        tileFromTip()
        for j in range(n - 1):
            tileFromBase(); tileFromTip()

def spiral(l):
    for i in range(1, l + 1):
        segment(i); bend(i)

gc(); gs(gridSize); fn()
spiral(length)
gc(); gs(gridSize); fn(); rot(8 * theta)
spiral(length)
gc(); gs(gridSize); fn(); rot(16 * theta)
spiral(length)
st()
