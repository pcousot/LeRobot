from LibRobot import *

# Draw a 60-degree jolygon
initialLength = 150
angle = 60
nbSegments = 80

gb(); pu(); fdn(3); pd()
gs(initialLength); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
