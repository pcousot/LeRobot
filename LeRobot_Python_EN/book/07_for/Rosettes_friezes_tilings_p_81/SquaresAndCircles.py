from LibRobot import *

# Draw a rosette of squares and circles
for f in range(4):
    # Draw a square
    for c in range(4):
        qtr(); fd(); fd()
    # Draw a circle
    for c in range(4):
        cr()
    # Turn left
    qtl()
st()
