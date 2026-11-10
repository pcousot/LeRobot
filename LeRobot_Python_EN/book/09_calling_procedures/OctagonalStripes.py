from LibRobot import *

# Draw stripes on the sides of an octagon
pu(); fdn(5); pd(); gs(4)
for i in range(8):
    # Draw 10 stripes of lengths 2, 4, ..., 20.
    for j in range(1, 11):
        # Draw a stripe of length (2 * j) centred
        # on a side of the octagon.
        fdn(j); fdn(-2 * j); fdn(j)
        # Move on to the next stripe (without drawing
        # the side of the octagon).
        pu(); qtr(); fd(); qtl(); pd()
    # Turn the robot perpendicular to the next
    # side.
    etr()
st()
