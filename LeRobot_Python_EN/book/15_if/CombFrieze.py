from LibRobot import *

# Draw a comb-shaped frieze
length = 15

gl()
for i in range(3 * length):
    fdn(2); qtr()
    if tw():
        qtr()
st()
