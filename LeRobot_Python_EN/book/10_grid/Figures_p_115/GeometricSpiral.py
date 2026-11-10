from LibRobot import *

# Draw a spiral of circular arcs of radii
# 1, 4, 9, 16, ...
ht()
for i in range(1, 13):
    gs(i * i); cl()
st()
