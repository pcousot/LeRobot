from LibRobot import *

# Draw the pattern of the polygonal Greek key
mf = 6  # Magnification factor

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

fe(); pattern(); st()
