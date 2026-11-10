from LibRobot import *

# A patch of a tiling of the plane by the "Spectre" (see Spectre.py), the
# chiral aperiodic monotile: 204 Spectres, none of them turned over, cover
# the whole window without gaps or overlaps. The tiling can be continued
# forever, but never periodically. The 25 Spectres in blue are turned by
# an odd multiple of 30 degrees with respect to the others.
#
# Each Spectre is given by (r, a, b, c, d): it is turned by r * 30 degrees
# (anticlockwise) about its starting corner, which is then moved to the
# point x = (a + b * sqrt(3)) / 2, y = (c + d * sqrt(3)) / 2. These
# positions were found by a program that places Spectres one after the
# other, side against side, going back when no Spectre fits.

unit = 20                  # length of a side, in points
r3 = sqrt(3)

# corners of the Spectre (sides of length 1) from its starting corner
corners = [(0, 0), (-0.866, -0.5), (-0.366, -1.366), (0.634, -1.366),
           (1.634, -1.366), (2.134, -0.5), (3, -1), (3.866, -0.5),
           (3.366, 0.366), (2.366, 0.366), (2.366, 1.366), (1.5, 1.866),
           (1, 1), (0, 1)]
# points well inside the Spectre, spread over it
inside = [(1.1, -0.1), (3.4, -0.4), (-0.4, -0.7), (1.7, 1.4), (2.3, 0.0),
          (0.4, 0.7)]
bend = 0.15                # how far the S-shaped sides bend
steps = 6                  # straight pieces to draw an S

spectres = [
    (0, 0, 0, 0, 0), (0, -3, 1, 3, 1), (10, -3, -1, 1, 1), (6, 6, -2, -2, -2),
    (10, 6, 0, -2, 0), (1, -2, -2, 2, 2), (9, 7, -1, -1, -3), (2, 0, 2, 4, 2),
    (4, -3, -3, 3, -3), (8, 3, -3, -3, -3), (4, 0, 0, 6, 2), (10, 6, 2, -2, 2),
    (8, 6, -2, -6, -2), (2, -6, -2, 4, 0), (2, -3, -3, 1, -5), (8, 6, 2, 0, 4),
    (4, -3, -5, 3, -5), (6, -3, -1, 7, 3), (4, 0, 2, 6, 4), (10, 6, 4, -2, 4),
    (5, -5, -3, -1, -5), (6, 0, -4, -2, -6), (0, 6, 0, -6, -4),
    (0, 3, 3, 3, 5), (11, 8, 2, 2, 4), (2, 9, 1, -5, -3), (2, -9, -3, 7, -1),
    (10, 6, -2, -8, -4), (6, -6, -6, 4, -4), (3, -1, 3, 5, 7),
    (0, 9, 5, -3, 3), (0, 0, 4, 6, 6), (8, -6, -6, 0, -4), (6, -6, 0, 10, 4),
    (6, 3, -5, -5, -7), (2, 9, 5, 1, 3), (0, -12, -4, 6, -2),
    (0, 9, -1, -9, -5), (4, 6, -4, -6, -8), (8, 15, 1, -9, -1),
    (2, -12, -4, 10, -2), (6, 15, 3, -5, 1), (10, -6, -6, -2, -6),
    (8, -3, 1, 9, 7), (4, 9, 5, 3, 5), (2, 0, 4, 10, 6), (5, -11, 1, 11, 5),
    (8, -9, -7, 3, -5), (6, 6, -6, -8, -8), (2, 3, 5, 7, 7),
    (4, -12, -4, 12, 0), (2, -9, 1, 13, 5), (6, 18, 2, -8, 0),
    (10, -12, -2, 10, 4), (2, 12, 6, -2, 4), (0, 12, -2, -12, -6),
    (6, 0, 2, 10, 8), (10, -15, -5, 7, -1), (2, 6, 6, 4, 8),
    (2, 6, -4, -8, -10), (4, 18, 4, -6, 0), (4, -9, -1, 15, 5),
    (8, -12, -8, 6, -6), (8, 3, -7, -9, -9), (4, -6, -8, 0, -10),
    (3, 17, 3, -13, -1), (4, 0, 4, 12, 8), (11, -13, -7, 11, -1),
    (2, 9, -3, -11, -9), (10, 9, 7, 1, 9), (10, -15, -7, 7, -3),
    (8, -12, -2, 12, 6), (2, 18, 4, -8, -2), (11, 17, -3, -13, -7),
    (8, -15, -7, 9, -1), (4, -9, 1, 15, 7), (1, 10, 6, 2, 10),
    (2, -3, -7, -5, -11), (10, 18, 6, -8, 4), (4, 18, 2, -12, -4),
    (0, 15, 7, -3, 7), (6, -3, 3, 13, 9), (4, 18, 0, -12, -6),
    (8, 18, 6, -6, 6), (3, 5, -5, -13, -9), (8, 15, -3, -15, -7),
    (0, 18, 4, -12, -2), (0, 6, -4, -12, -10), (0, 12, 8, 0, 8),
    (2, -6, -8, -2, -12), (7, -16, -8, 8, -8), (6, -12, -2, 16, 6),
    (4, -15, -9, 9, -7), (0, -18, -6, 12, 0), (0, 9, 9, 3, 9),
    (4, -9, 3, 15, 9), (11, 20, 6, -4, 6), (8, -15, -3, 15, 5),
    (10, 18, 8, -8, 6), (10, 15, -1, -17, -7), (2, 21, 5, -11, -1),
    (10, 0, 6, 10, 12), (11, -7, -11, -1, -11), (4, 6, -6, -12, -12),
    (0, -15, -9, 3, -9), (2, 18, 0, -14, -8), (0, -6, -8, -6, -12),
    (6, 9, 7, 7, 11), (2, -21, -7, 13, -3), (10, 15, -3, -17, -9),
    (0, -9, 5, 15, 11), (0, -21, -5, 15, 1), (0, -12, -10, 0, -10),
    (10, -9, -9, -5, -11), (6, -15, -11, 7, -7), (6, 24, 2, -14, -4),
    (4, 12, 8, 6, 10), (6, 12, -6, -14, -12), (3, -10, 4, 14, 12),
    (6, -18, -10, 10, -6), (2, -21, -3, 19, 3), (8, -9, -11, -3, -11),
    (2, 12, 10, 4, 10), (0, -3, -9, -9, -13), (0, -18, 0, 18, 8),
    (0, 3, 9, 9, 13), (0, 18, 0, -18, -8), (0, 21, 9, -9, 5),
    (10, -18, -10, 4, -8), (2, 21, 9, -5, 5), (10, 0, 8, 10, 14),
    (2, 21, 1, -17, -7), (4, 6, -8, -12, -14), (2, 24, 6, -14, 0),
    (0, -24, -4, 18, 2), (8, 0, 6, 12, 14), (4, 21, 9, -3, 7),
    (4, 15, -5, -15, -13), (0, -24, -8, 12, -4), (1, 25, 1, -19, -5),
    (2, -24, -8, 16, -4), (10, -9, -11, -5, -13), (10, -24, -6, 16, 2),
    (6, 27, 7, -11, 3), (4, -21, -3, 21, 5), (4, -21, -5, 21, 3),
    (8, -18, -12, 6, -8), (8, -12, 2, 18, 12), (4, 12, 10, 6, 12),
    (4, 27, 3, -15, -5), (2, 3, 9, 13, 13), (11, 2, 6, 14, 14),
    (2, -15, -11, 1, -13), (1, 28, 6, -16, 2), (4, -24, -8, 18, -2),
    (10, 24, 2, -20, -6), (4, 27, 5, -15, -3), (8, 18, 10, 0, 12),
    (3, -25, -9, 11, -3), (10, -18, -12, 4, -10), (4, 6, -10, -12, -16),
    (4, -24, -10, 12, -6), (0, -21, 1, 21, 9), (2, 24, 10, -8, 6),
    (10, -21, -1, 19, 9), (2, 6, 10, 10, 14), (10, 24, 0, -20, -8),
    (1, -23, -7, 17, 3), (0, 24, 4, -18, -6), (10, 27, 7, -17, 1),
    (10, 21, 11, -5, 11), (2, -6, -10, -8, -16), (8, -6, -12, -6, -16),
    (6, -24, -10, 16, -2), (9, -17, -13, 5, -13), (2, 9, 11, 7, 15),
    (2, 27, 5, -17, -5), (2, -27, -7, 19, 1), (8, 21, 11, -3, 13),
    (4, 30, 8, -12, 2), (6, -24, -6, 22, 4), (2, -24, -2, 22, 8),
    (4, -9, -13, -3, -17), (2, -24, -12, 10, -10), (10, 12, 12, 4, 16),
    (0, -18, -12, 0, -14), (0, 27, 3, -21, -7), (6, 21, 11, 1, 13),
    (7, -10, -12, -4, -18), (6, -12, -14, -2, -16), (1, 13, 11, 5, 17),
    (0, 15, 13, 3, 15), (9, 22, 12, 2, 12), (2, -30, -8, 22, 0),
    (6, -9, -15, -5, -17), (8, 33, 5, -21, -3), (0, 12, 14, 6, 16),
    (0, -30, -4, 24, 6), (4, -18, -14, 0, -16), (4, -30, -6, 24, 4),
    (10, 33, 3, -23, -7), (6, 36, 6, -20, -2), (10, 33, 5, -23, -5),
    (3, -31, -5, 23, 7)]


def place(point, r, a, b, c, d):
    # Position (in units) of a point of the Spectre put at (r, a, b, c, d)
    x, y = point
    angle = r * pi / 6
    return (x * cos(angle) - y * sin(angle) + (a + b * r3) / 2,
            x * sin(angle) + y * cos(angle) + (c + d * r3) / 2)


def curvedSide(ax, ay, bx, by):
    # S-shaped curve from (ax, ay) to (bx, by): the same whichever way it
    # is drawn, so that neighbouring Spectres fit together
    for k in range(1, steps + 1):
        t = k / steps
        s = bend * sin(2 * pi * t)
        drawToReal(ax + t * (bx - ax) - s * (by - ay),
                   ay + t * (by - ay) + s * (bx - ax))


def drawSpectre(tile):
    points = [place(p, *tile) for p in corners]
    pu(); moveToReal(points[0]); pd()
    for k in range(len(points)):
        ax, ay = points[k]
        bx, by = points[(k + 1) % len(points)]
        curvedSide(ax, ay, bx, by)


def colourOf(r):
    # Spectres turned by an odd multiple of 30 degrees in blue, the others
    # by orientation
    if r % 2 == 1:
        return blue
    return [yellow, green, red][r // 2 % 3]


def paintSpectre(tile):
    # paint the Spectre from a point inside it; a Spectre cut by the edge
    # of the window is painted from each of these points in the window
    points = [place(p, *tile) for p in inside]
    visible = [(x, y) for x, y in points
               if abs(x * unit) < 397 and abs(y * unit) < 335]
    if len(visible) == len(points):
        visible = visible[:1]
    pc(colourOf(tile[0]))
    for x, y in visible:
        pu(); moveToReal(x, y); fn()
        paint()


hideRobot(); allowExits()
gs(unit); pw(1); pc(black)
for tile in spectres:
    drawSpectre(tile)
for tile in spectres:
    paintSpectre(tile)
pc(black)
message("A tiling by the Spectre: 204 tiles, none turned over")
st()
