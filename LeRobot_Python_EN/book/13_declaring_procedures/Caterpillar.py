from LibRobot import *

# Draw a caterpillar
gridSize = 6
numberOfRings = 7

# Shift to the left by half the length of the
# caterpillar
def toLeft(n):
    gs(2 * gridSize)
    pu(); qtl(); fdn(n); qtr(); pd()

# Draw the back of the caterpillar made of n
# rings of radius equal to (2 * gridSize)
def back(n):
    gs(2 * gridSize)
    for i in range(n):
        cr(); cr(); ht()
    ht(); cr()

# Draw a leg of the caterpillar of length
# gridSize
def leg():
    gs(gridSize)
    qtl(); fd(); ht(); fd(); qtl()

# Draw p legs of the caterpillar spaced
# (2 * gridSize) apart
def legs(p):
    leg()
    for i in range(p - 1):
        gs(2 * gridSize); fd()
        leg()

# Draw the head of the caterpillar
def head():
    gs(gridSize); cr(); cr()
    # Eye
    pu(); gs(2 * gridSize); fd()
    qtl(); pd(); dc(); pc(yellow); paint()

# Draw a caterpillar with n rings and (2 * n)
# legs
def caterpillar(n):
    toLeft(n); back(n); legs(2 * n); head()

caterpillar(numberOfRings); st()
