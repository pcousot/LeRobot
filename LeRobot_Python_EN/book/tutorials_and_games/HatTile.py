from LibRobot import *

# The "hat", discovered by David Smith in November 2022 and proved
# aperiodic with Joseph Samuel Myers, Craig S. Kaplan and Chaim
# Goodman-Strauss ("An aperiodic monotile", 2023): a single tile that
# covers the whole plane, but never periodically. It is made of eight
# kites of the hexagonal kite grid: its 13 sides have lengths 1 and
# square root of 3 (one side, of length 2, is made of two sides of
# length 1 in line), and its corners turn by 60 or 90 degrees.
# To tile the plane, some hats must be turned over: the mirror image
# of the hat (the "anti-hat") is drawn on the right.

unit = 36                  # length 1, in points
r3 = sqrt(3)

# the outline, side after side: turn (degrees, anticlockwise) before
# the side, then length of the side
sides = [(-60, r3), (90, 1), (60, 2), (60, 1), (-90, r3), (60, r3),
         (90, 1), (60, 1), (-90, r3), (60, r3), (90, 1), (-60, 1),
         (90, r3)]

# a point well inside the hat, seen from the starting corner (the robot
# facing north, x to the right, y up)
insideX = 1.6
insideY = 0.5


def hat(u, mirror):
    # Draw a hat with sides of length u, starting and ending at the same
    # corner, facing north; mirror = -1 draws its mirror image
    rot(mirror * 180)          # facing the direction before the first side
    for turn, length in sides:
        rot(mirror * turn)
        fdl(length * u)
    rot(-mirror * 180)         # facing north again


def paintHat(u, mirror):
    # Paint the inside of the hat drawn from the robot's corner
    angle = atan2(insideY, insideX) * 180 / pi - 90
    distance = sqrt(insideX ** 2 + insideY ** 2) * u
    pu()
    rot(mirror * angle); fdl(distance)
    paint()
    ht(); fdl(distance); ht(); rot(-mirror * angle)
    pd()


hideRobot()
gs(unit); pu(); moveToReal(-6.5, 1.5); pd()
pw(3)
pc(blue); hat(unit, 1); paintHat(unit, 1)
pu(); qtr(); fdl(11 * unit); qtl(); pd()
pc(red); hat(unit, -1); paintHat(unit, -1)
message("The hat of David Smith (blue) and its mirror image (red)")
st()
