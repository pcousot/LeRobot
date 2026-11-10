from LibRobot import *

# Draw a 118-degree jolygon
initialLength = 300
angle = 118
nbSegments = 80

gb(); gl()
gs(initialLength); qtr(); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
