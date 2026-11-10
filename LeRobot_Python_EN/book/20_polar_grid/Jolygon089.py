from LibRobot import *

# Draw a 89-degree jolygon
initialLength = 250
angle = 89
nbSegments = 80

gb(); gl()
gs(initialLength); qtr(); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
