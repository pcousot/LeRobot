from LibRobot import *

# Tiling of the disc with Voderberg tiles

# The Voderberg tiles are arranged in circular rings
gridSize = 8
n = 12  # 2 * n tiles form a circle
c = 3  # Number of rings
theta = 15

# Draw a Voderberg tile starting from the tip.
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

# Draw a Voderberg tile starting from the base.
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

def tiling():
    for i in range(1, c + 1):
        for j in range(2 * n):
            tileFromTip()
            for k in range(i - 1):
                tileFromBase(); tileFromTip()
        # Go to the next outer ring.
        pu()
        fd(); ht(); rot(11 * theta)
        fd(); ht(); rot(11 * theta)
        fd(); ht(); rot(11 * theta)
        fd(); ht(); rot(-(9 * theta))
        pd()

gs(gridSize); tiling(); st()
