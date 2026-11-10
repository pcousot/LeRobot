from LibRobot import *

# Draw a 175-degree jolygon
initialLength = 350
angle = 175
nbSegments = 40

gl()
gs(initialLength); qtr(); fd()
for i in range(nbSegments - 1):
    rot(angle); fdl(valFdl() * 0.95)
st()
