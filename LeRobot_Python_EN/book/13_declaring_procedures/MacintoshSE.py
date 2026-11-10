from LibRobot import *

# Draw a microcomputer

# Draw a rectangle of given height and width,
# the robot starting and ending at the lower
# left corner, facing north.
def rectangle(height, width):
    for i in range(2):
        fdn(height); qtr(); fdn(width); qtr()

# Keyboard
rectangle(1, 8)
# Case
fd(); qtr(); fd(); qtl(); rectangle(3, 6)
fdn(3); rectangle(5, 6)
# Screen
qtr(); fd(); qtl(); pu(); fd(); pd()
rectangle(3, 4)
# Logo represented by a cross
ht(); pu(); fdn(3); pd(); dc()
# Lower floppy disk drive
qtl(); pu(); fd(); fd(); pd(); fdn(2)
# Upper floppy disk drive
qtl(); pu(); fd(); qtl(); pd(); fdn(2)
st()
