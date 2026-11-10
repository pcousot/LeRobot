from LibRobot import *

# Draw a frieze of flowers
gl(); pu(); qtr(); fd(); fd(); pd()
for i in range(8):
    for j in range(8):
        cr(); fd(); fd(); cr(); etr()
    pu()
    for j in range(5):
        fd()
    pd()
st()
