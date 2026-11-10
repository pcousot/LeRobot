from LibRobot import *

# Tiling of the disc with isosceles triangles

# The isosceles triangles are arranged in circular
# rings
n = 12
lo = 30
c = 4  # Number of rings
baseAngle = (180 - 180 / n) / 2

# Draw an isosceles triangle starting from the tip
def tip():
    fdl(lo)
    rot(180 - baseAngle)
    fdl(2 * lo * cos(baseAngle / 180 * pi))
    rot(180 - baseAngle)
    fdl(lo); ht()

# Draw an isosceles triangle starting from the base
def tib():
    fdl(lo)
    rot(180 - 180 / n); fdl(lo)
    rot(180 - baseAngle)
    fdl(2 * lo * cos(baseAngle / 180 * pi))
    pu(); fdn(-1); pd()
    rot(baseAngle)

def tiling():
    for i in range(1, c + 1):
        for j in range(2 * n):
            tip()
            for k in range(i - 1):
                tib(); tip()
        fd()

tiling(); st()
