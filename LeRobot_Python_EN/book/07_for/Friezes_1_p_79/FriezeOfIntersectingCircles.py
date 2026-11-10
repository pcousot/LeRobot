from LibRobot import *

# Draw a frieze of intersecting circles
gl()
# Draw a frieze of intersecting circles
for i in range(40):
    # Draw a circle, starting from the westernmost
    # point, with the robot facing north
    cr(); cr(); cr(); cr()
    # Move the robot to the centre of the circle, facing
    # north
    pu(); qtr(); fd(); qtl(); pd()
st()
