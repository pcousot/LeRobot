from LibRobot import *

# Draw a square painted in each of the eight colours
# of the robot's pens, with the name of the colour
n = 3  # Size of a square

# Draw a square under the name of the colour
def square():
    pc(black); translate(0, -(n + 1))
    fdn(n); qtr(); fdn(n); qtr(); fdn(n); qtr(); fdn(n)

# Paint the square and go on to the next one
def paintSquare():
    etl(); paint(); tetr(); translate(n + 1, n + 1)

gl()
pc(black); label("white"); square()
pc(white); paintSquare()
pc(yellow); label("yellow"); square()
pc(yellow); paintSquare()
pc(blue); label("blue"); square()
pc(blue); paintSquare()
pc(violet); label("violet"); square()
pc(violet); paintSquare()
pc(green); label("green"); square()
pc(green); paintSquare()
pc(red); label("red"); square()
pc(red); paintSquare()
pc(indigo); label("indigo"); square()
pc(indigo); paintSquare()
pc(black); label("black"); square()
pc(black); paintSquare()
st()
