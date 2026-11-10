from LibRobot import *

# Tiling of the plane with two spirals
# made of Voderberg tiles
gridSize = 6
n = 12  # n adjacent tiles form a half circle
theta = 15
c = 4  # Number of half rings making up a spiral

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

def spiral():
    for i in range(1, c + 1):
        for j in range(n):
            tileFromTip()
            for k in range(i - 1):
                tileFromBase(); tileFromTip()

# Draw a mirror Voderberg tile starting from the tip.
def mirrorTileFromTip():
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(4 * theta)
    fd(); ht(); rot(7 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht()

# Draw a mirror Voderberg tile starting from the base.
def mirrorTileFromBase():
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(7 * theta)
    fd(); fdn(-1); rot(-(7 * theta))

def mirrorSpiral():
    for i in range(1, c + 1):
        for j in range(n):
            mirrorTileFromTip()
            for k in range(i - 1):
                mirrorTileFromBase(); mirrorTileFromTip()

gs(gridSize); spiral()
gc(); gs(gridSize); fn(); pu()
fd(); ht(); rot(11 * theta)
fd(); ht(); rot(11 * theta)
fd(); ht(); rot(11 * theta)
fd(); ht()
pd()
mirrorSpiral(); st()
