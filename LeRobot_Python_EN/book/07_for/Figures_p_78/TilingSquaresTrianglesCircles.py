from LibRobot import *

# Draw a tiling of squares, triangles and circles

# Draw a square with sides of size 2, the robot
# starting from the lower left corner facing east,
# and arriving pen down at the lower right corner
# also facing east.
def square():
    # Draw the square.
    fd(); fd(); qtl(); fd(); fd(); qtl()
    fd(); fd(); qtl(); fd(); fd(); qtl()
    # Advance to the lower right corner.
    fd(); fd()

# Draw two triangles joined at a vertex
# inscribed in an invisible square of the grid of
# side 2, starting from the lower left corner of the square
# facing east, and arriving at the lower right
# corner, pen down and facing east.
def triangles():
    pu(); fd(); pd()
    qtl(); fd(); fd(); tetl(); fd(); tetl()
    fd(); fd(); tetr(); fd(); tetl()
    pu(); fd(); pd()

# Draw a circle of radius 1 inscribed in an invisible
# square of the grid of side 2, starting from the
# lower left corner of the square facing east, and
# arriving at the lower right corner of the square, pen
# down and facing east.
def circle():
    pu(); fd(); pd()
    cl(); cl(); cl(); cl()
    pu(); fd(); pd()

# Draw a row made of a pattern repeated 7
# times, the pattern being made of a square, triangles
# and a circle side by side, the robot starting from the
# lower left corner of the row facing east, and
# arriving at the lower right corner also facing
# east.
def rowSquare():
    for i in range(7):
        # The robot is pen down, facing east, at the bottom
        # left of the pattern
        square(); triangles(); circle()

# Like rowSquare, with the pattern made of triangles,
# a circle and a square.
def rowTriangles():
    for i in range(7):
        triangles(); circle(); square()

# Like rowSquare, with the pattern made of a circle,
# a square and triangles.
def rowCircle():
    for i in range(7):
        circle(); square(); triangles()

# Bring the robot from the lower right corner of a row
# to the lower left corner of the next row, without
# drawing, facing east and pen down.
def newRow():
    pu(); gl(); qtr(); fd(); fd(); qtl(); pd()

# Tile the screen with 11 rows of patterns starting with
# a square, then with triangles, then with a
# circle, from the upper right corner to the lower
# right corner of the screen, the robot facing east.
def tiling():
    # Draw rows 1 to 9 from top to bottom.
    for j in range(3):
        newRow(); rowSquare()
        newRow(); rowTriangles()
        newRow(); rowCircle()
    # Draw rows 10 then 11.
    newRow(); rowSquare()
    newRow(); rowTriangles()

# Go to the upper right corner, facing east.
gt(); gr(); qtr()
# Tile the screen.
tiling(); st()
