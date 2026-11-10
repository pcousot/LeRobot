from LibRobot import *

# Draw a frieze of spikes
gl(); qtr()
for j in range(32):
    pu(); fd(); pd(); ht(); cr(); ht()
    fd(); fd(); ht(); cr()
st()
