from LibRobot import *

# Draw a Voderberg tile
gridSize = 90
theta = 15

# Draw a Voderberg tile starting from the tip.
def tile():
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(11 * theta)
    fd(); ht(); rot(7 * theta)
    fd(); ht(); rot(4 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht(); rot(13 * theta)
    fd(); ht()

gb(); gl(); gs(gridSize); rot(-20); tile()
st()
