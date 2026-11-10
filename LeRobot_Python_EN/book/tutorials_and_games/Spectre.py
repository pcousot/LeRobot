from LibRobot import *

# The "Spectre", discovered by David Smith, Joseph Samuel Myers, Craig S.
# Kaplan and Chaim Goodman-Strauss ("A chiral aperiodic monotile", 2023),
# a few months after the hat (see HatTile.py): a single tile that covers
# the whole plane, never periodically, WITHOUT ever being turned over.
# On the left, the polygon Tile(1,1): the hat's 14 sides with all lengths
# equal to 1 (the sides keep their directions, multiples of 30 degrees).
# Polygons Tile(1,1) can still be turned over in some tilings; replacing
# every side by the same S-shaped curve (on the right) forbids it: an
# S matches an S, but a turned-over S does not. That is the Spectre.

unit = 48                  # length of a side, in points

# the outline, side after side: turn (degrees, anticlockwise) before the
# side; all sides have length 1
turns = [-60, 90, 60, 0, 60, -90, 60, 90, 60, -90, 60, 90, -60, 90]

# a point well inside the tile, seen from the starting corner (the robot
# facing north, x to the right, y up)
insideX = 1.1
insideY = -0.1

# corners of the tile, in units, from the starting corner
corners = [(0, 0), (-0.866, -0.5), (-0.366, -1.366), (0.634, -1.366),
           (1.634, -1.366), (2.134, -0.5), (3, -1), (3.866, -0.5),
           (3.366, 0.366), (2.366, 0.366), (2.366, 1.366), (1.5, 1.866),
           (1, 1), (0, 1)]
bend = 0.15                # how far the S-shaped sides bend
steps = 12                 # straight pieces to draw an S


def polygon(u):
    # Draw the polygon Tile(1,1) with sides of length u, starting and
    # ending at the same corner, facing north
    rot(180)               # facing the direction before the first side
    for turn in turns:
        rot(turn)
        fdl(u)
    rot(-180)              # facing north again


def paintTile(u):
    # Paint the inside of the tile drawn from the robot's corner
    angle = atan2(insideY, insideX) * 180 / pi - 90
    distance = sqrt(insideX ** 2 + insideY ** 2) * u
    pu()
    rot(angle); fdl(distance)
    paint()
    ht(); fdl(distance); ht(); rot(-angle)
    pd()


def curvedSide(ax, ay, bx, by):
    # Draw from (ax, ay) to (bx, by) an S-shaped curve: it bends to the
    # left in its first half and to the right in its second half, so that
    # it is the same curve whichever way it is drawn
    for k in range(1, steps + 1):
        t = k / steps
        s = bend * sin(2 * pi * t)
        drawToReal(ax + t * (bx - ax) - s * (by - ay),
                   ay + t * (by - ay) + s * (bx - ax))


def spectre(x, y):
    # Draw the Spectre, its starting corner at (x, y) (in units)
    pu(); moveToReal(x, y); pd()
    for k in range(len(corners)):
        ax, ay = corners[k]
        bx, by = corners[(k + 1) % len(corners)]
        curvedSide(x + ax, y + ay, x + bx, y + by)


hideRobot()
gs(unit); pw(3)
pc(red); spectre(3, 0.75)
pu(); moveToReal(3 + insideX, 0.75 + insideY); fn(); paint()
pu(); moveToReal(-6, 0.75); fn(); pd()
pc(blue); polygon(unit); paintTile(unit)
message("Tile(1,1) (blue) and the Spectre (red), which never needs turning over")
st()
