from LibRobot import *

# Draw a singular propeller
xbase = 13  # Width of the base grid
ybase = 8  # Height of the base grid
numberOfLeaves = 8  # Leaves of a blade
numberOfBlades = 4  # Blades of the propeller

def blade():
    for i in range(1, numberOfLeaves + 1):
        # Draw a quarter of an ellipse, of size
        # (xbase * i, ybase * i), without changing
        # the initial orientation of the robot
        gsX(xbase * i)
        gsY(ybase * i)
        fd(); qtl(); fd(); qtl(); cl(); qtl()

for j in range(numberOfBlades):
    blade(); qtr()
st()
