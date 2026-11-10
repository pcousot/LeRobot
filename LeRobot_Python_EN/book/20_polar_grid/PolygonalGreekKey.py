from LibRobot import *

# Draw a polygonal Greek key
mf = 2  # Magnification factor
n = 10  # Number of sides

def pattern():
    # Left part
    fdl(13 * mf); rot(90); fdl(8 * mf); rot(90)
    fdl(6 * mf); rot(90); fdl(4 * mf); rot(90)
    fdl(2 * mf); rot(90); fdl(2 * mf); rot(-90)
    fdl(2 * mf); rot(-90); fdl(4 * mf); rot(-90)
    fdl(6 * mf); rot(-90); fdl(8 * mf); rot(-90)
    fdl(18 * mf); rot(-90)
    # Symmetric right part
    fdl(8 * mf); rot(-90); fdl(6 * mf); rot(-90)
    fdl(4 * mf); rot(-90); fdl(2 * mf); rot(-90)
    fdl(2 * mf); rot(90); fdl(2 * mf); rot(90)
    fdl(4 * mf); rot(90); fdl(6 * mf); rot(90)
    fdl(8 * mf); rot(90)
    fdl(13 * mf)

def greekKey():
    for i in range(n):
        pattern(); rot(360 / n)

greekKey(); st()
