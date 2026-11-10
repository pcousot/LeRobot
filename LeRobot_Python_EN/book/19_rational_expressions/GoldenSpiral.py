from LibRobot import *

# Draw a golden spiral
goldenRatio = (1 + sqrt(5)) / 2

gs(100)
for i in range(12):
    cr()
    gs(valGsX() / goldenRatio)
st()
