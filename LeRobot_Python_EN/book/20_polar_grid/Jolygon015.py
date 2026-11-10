from LibRobot import *

# Draw a 15-degree jolygon
initialLength = 60
angle = 15
nbSegments = 100

gb(); gr(); pu(); fdn(2); pd()
gs(initialLength); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
