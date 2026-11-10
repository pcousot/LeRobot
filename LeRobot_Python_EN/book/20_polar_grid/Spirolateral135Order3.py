from LibRobot import *

# Draw a spirolateral of order 3 at 135 degrees
gs(20)
for i in range(8):
    rot(135)
    fd(); rot(-135)
    fd(); fd(); rot(-135)
    fd(); fd(); fd()
st()
