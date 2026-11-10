from LibRobot import *

# Draw a 72-degree jolygon
initialLength = 150
angle = 72
nbSegments = 80

gb(); pu(); fd(); fd(); pd()
gs(initialLength); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
