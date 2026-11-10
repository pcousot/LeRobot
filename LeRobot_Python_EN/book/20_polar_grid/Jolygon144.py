from LibRobot import *

# Draw a 144-degree jolygon
initialLength = 200
angle = 144
nbSegments = 60

gb(); pu(); fd(); pd()
gs(initialLength); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
