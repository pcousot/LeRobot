from LibRobot import *

# Successive rotations of 15 degrees: the segments
# drawn by fd() all have the same length
sideLength = 50
n = 24

message("gs(50); fe(); fd()")
gs(sideLength); fe(); fd(); markPause()
for i in range(n):
    message("gc(); rot(15); fd()")
    gc(); rot(360 / n); fd()
    markPause()
st()
