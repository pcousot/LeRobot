from LibRobot import *

# Draw a segmented spiral

# Turn left then move the robot straight ahead
# l times the grid size to form a
# quarter turn.
def quarterTurn(l):
    qtl(); fdn(l)

# Draw two successive quarter turns to form
# a half turn.
def halfTurn(l):
    quarterTurn(l)
    quarterTurn(l)

# Draw a spiral of n half turns
def spiral(n):
    for l in range(1, n + 1):
        halfTurn(l)

gs(6); spiral(19); st()
