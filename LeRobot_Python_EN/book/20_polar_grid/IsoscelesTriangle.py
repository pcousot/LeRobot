from LibRobot import *

# Draw an isosceles triangle
sideLength = 50
angle = 70

gsRT(sideLength, angle)
etr(); fd()
qtr(); fd()
tetr(); fdn(2)
st()
