from LibRobot import *

# Draw a pentagon
sideLength = 50

gs(sideLength); fe()
for j in range(5):
    fd()
    rot(72)
st()
