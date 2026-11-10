from LibRobot import *

# Draw a snail
# Go up to the centre of the shell
pu(); fdn(4); pd(); qtr()
# Shell
for i in range(1, 12):
    cl(); gs(12 + 5 * i)
gs(12); fdn(4)
# Body
qtr(); fdn(9); cl(); cl(); fdn(31); ht(); etr()
fdn(2); etl(); fdn(14)
# Go to the antenna
pu(); fdn(10); pd(); fdn(4)
# Antenna
etr(); fd(); gs(2); cl(); cl(); cl(); cl()
gs(12); ht(); fd()
# Eye
etr(); pu(); fd(); pd()
gs(2); cl(); cl(); cl(); cl()
st()
