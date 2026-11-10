# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# *                                                     *
# *******************************************************
from LibRobot import *

r = 0

for i in range(1000):
    # Draw at random a number R between 0 and 7
    r = abs(random()) % 8
    # Turn on the spot R quarter turns to the right
    face(r)
    # Draw at random a number R between 1 and 5
    r = abs(random()) % 5 + 1
    # Move forward R times in the current direction, unless the robot touches the border
    while r != 0 and not tb():
        fd()
        r -= 1
st()
