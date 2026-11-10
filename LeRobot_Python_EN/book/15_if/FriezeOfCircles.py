from LibRobot import *

# Draw a frieze of circles
numberOfCircles = 19

gl(); qtr()
for i in range(4 * numberOfCircles):
    if te():
        pu(); fdn(2); pd()
    cr()
st()
