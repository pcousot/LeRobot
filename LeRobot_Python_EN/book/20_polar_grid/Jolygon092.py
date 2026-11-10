from LibRobot import *

# Draw a 92-degree jolygon
initialLength = 200
angle = 92
nbSegments = 80

gb(); pu(); fd(); pd()
gs(initialLength); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
