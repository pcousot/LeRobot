from LibRobot import *

# A patch of the tiling of the plane by the "hat" of David Smith (2022),
# the aperiodic monotile (see HatTile.py): 181 hats, 23 of them turned
# over (in blue), cover the whole window without gaps or overlaps. The
# tiling can be continued forever, but never periodically.
#
# Each hat is given by its position on the hexagonal kite grid: (o, i, j)
# where o is its orientation (rotation by o * 60 degrees for o < 6; turned
# over, then rotated by (o - 6) * 60 degrees for o >= 6) and (i, j) the
# hexagon of the kite grid that its corner (0, 0) is moved to. These
# positions were found by a program that places hats one after the other,
# going back when no hat fits.

unit = 16                  # length 1 (the short side of a kite), in points
r3 = sqrt(3)

# corners of the hat, in the coordinates of the kite grid (side 1)
outline = [(0, 0), (-1.5, -r3 / 2), (-1, -r3), (1, -r3), (1.5, -r3 / 2),
           (3, -r3), (4.5, -r3 / 2), (4, 0), (3, 0), (3, r3), (1.5, 3 * r3 / 2),
           (1, r3), (0, r3)]
# centres of the 8 kites of the hat (points inside the hat)
kites = [(1.25, 0.0), (0.625, 1.083), (-0.625, -1.083), (0.625, -1.083),
         (3.625, -0.65), (2.375, -0.65), (1.75, 1.732), (2.375, 0.65)]

tiles = [
    (0, 0, 0), (1, -1, 0), (4, 0, -1), (10, 1, -1), (0, 0, 1), (2, -1, 1),
    (6, -1, 2), (2, 2, -1), (2, -2, 1), (0, 1, -2), (1, 1, 1), (0, -2, 0),
    (1, 2, -2), (5, 0, -2), (2, 0, 2), (1, 2, 0), (6, -3, 1), (2, -1, -2),
    (3, -2, -1), (4, -2, 3), (3, -3, 2), (5, 3, -1), (2, 1, 2), (3, -1, 3),
    (0, 1, -3), (2, -3, 0), (11, 3, 0), (4, 3, -3), (3, -3, 3), (0, 4, -2),
    (3, -2, -2), (4, -4, 2), (2, 2, 2), (1, -1, -3), (3, 4, -3), (3, 3, 1),
    (3, 1, -4), (0, -1, 4), (1, 4, -1), (1, -3, 4), (4, 0, -4), (2, 4, 0),
    (2, -4, 0), (7, -4, 4), (6, 4, -4), (7, -2, -3), (2, 2, -5), (2, 3, -5),
    (5, -2, 5), (2, -3, 5), (6, 2, 3), (4, -3, -2), (0, 3, 2), (4, -5, 3),
    (1, 5, -2), (3, -1, -4), (4, 1, 4), (2, 4, -5), (6, 1, -5), (0, -1, 5),
    (3, -4, 5), (1, -4, -1), (2, 5, -4), (5, -5, 4), (1, 0, 5), (0, 5, -5),
    (4, -5, 5), (5, 5, 0), (10, -5, 0), (1, 3, -6), (2, 3, 3), (8, -6, 3),
    (5, -3, -3), (1, 6, -3), (3, 2, 4), (0, -6, 2), (1, 4, 2), (2, 6, -4),
    (2, -6, 4), (3, -4, 6), (4, -2, 6), (0, 2, -6), (2, 1, -6), (10, -1, 6),
    (3, 5, -6), (4, 5, 1), (0, -6, 1), (0, -5, -1), (3, -1, -5), (1, 6, -5),
    (2, 0, -6), (1, -6, 6), (4, -6, 0), (7, 6, 0), (2, 0, 6), (0, -4, 7),
    (1, -3, 7), (5, -7, 3), (1, 4, -7), (4, -7, 4), (5, 7, -4), (2, 4, 3),
    (11, 7, -3), (5, -4, -3), (0, -5, -2), (3, -7, 5), (3, 2, 5), (3, 7, -2),
    (0, -2, 7), (0, 2, -7), (2, -5, 7), (11, 5, -7), (1, -7, 1), (2, 6, -7),
    (0, -7, 6), (3, 7, -1), (3, 6, 1), (1, 1, -7), (2, -6, 7), (5, -6, -1),
    (4, 7, -6), (3, -1, -6), (2, 4, -8), (1, 8, -4), (9, -4, -4), (2, -4, 8),
    (4, 3, 5), (1, -3, -5), (5, 7, -7), (5, 5, -8), (6, -5, 8), (0, 8, -5),
    (2, 8, -3), (1, 7, 0), (2, -8, 3), (3, -5, -3), (2, -7, 7), (4, -8, 5),
    (2, 5, 3), (3, 8, -6), (1, 6, -8), (1, -8, 2), (3, 6, 2), (2, -8, 6),
    (4, 8, -1), (0, -8, 1), (6, -8, 7), (2, -7, -1), (2, 7, 1), (5, 8, -7),
    (1, 4, -9), (3, -5, 9), (6, 5, 4), (4, -6, 9), (0, 6, -9), (11, -9, 3),
    (4, -6, -3), (2, 9, -3), (0, 6, 3), (3, -8, 0), (3, -8, 8), (1, 7, -9),
    (1, -7, -2), (5, -9, 2), (9, 9, -7), (0, -8, 9), (3, 9, -1), (3, -8, -1),
    (2, 8, 1), (3, -7, -3), (1, -7, 10), (1, 7, 3), (3, 9, -9), (3, 9, 0),
    (0, -8, 10), (1, 8, -10), (7, -8, -2), (1, 8, 2), (5, -9, 10), (2, 8, -11),
    (6, -9, 11)]


def place(point, o, i, j):
    # Position (in units) of a point of the hat put at (o, i, j)
    x, y = point
    if o >= 6:             # turned over
        y = -y
    a = (o % 6) * pi / 3
    x, y = x * cos(a) - y * sin(a), x * sin(a) + y * cos(a)
    # centre of the hexagon (i, j) of the kite grid
    return (x + 3 * i, y + r3 * (i + 2 * j))


def drawHat(o, i, j):
    pu(); moveToReal(place(outline[0], o, i, j)); pd()
    for p in outline[1:] + outline[:1]:
        drawToReal(place(p, o, i, j))


def colourOf(o):
    # turned over hats in blue, the others by orientation
    if o >= 6:
        return blue
    return [yellow, green, red][o % 3]


def paintHat(o, i, j):
    # paint the hat from the centre of one of its kites; a hat cut by the
    # edge of the window is painted from each of its kites in the window
    points = [place(k, o, i, j) for k in kites]
    visible = [(x, y) for x, y in points
               if abs(x * unit) < 397 and abs(y * unit) < 335]
    if len(visible) == len(points):
        visible = visible[:1]
    pc(colourOf(o))
    for x, y in visible:
        pu(); moveToReal(x, y); fn()
        paint()


hideRobot(); allowExits()
gs(unit); pw(1); pc(black)
for o, i, j in tiles:
    drawHat(o, i, j)
for o, i, j in tiles:
    paintHat(o, i, j)
pc(black)
message("A tiling by the hat of David Smith: 181 hats, 23 turned over (blue)")
st()
