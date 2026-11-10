from LibRobot import *

# Draw a rosette of ten pentagons
sideLength = 40

qtr(); gs(sideLength)
for i in range(10):
    rot(36)
    for j in range(5):
        fd(); rot(72)
st()
