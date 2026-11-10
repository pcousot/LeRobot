from LibRobot import *

# Draw a dotted square

# Draw a dotted line of n dots,
# assuming n > 1.
def dottedLine(n):
    gs(8); pw(2); pu()
    for l in range(n - 1):
        dp(); fd()
    dp(); pd()

# Draw a dotted square with p dots per side
# (p > 1).
def square(p):
    for c in range(4):
        dottedLine(p); qtr()

square(30); hideRobot(); st()
