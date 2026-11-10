from LibRobot import *

# Draw a snail
# Go up to the centre of the shell
pu(); fdn(4); pd(); qtr()
# Shell
cl(); gs(17); cl(); gs(22); cl(); gs(27); cl()
gs(32); cl()
gs(37); cl(); gs(42); cl(); gs(47); cl(); gs(52)
cl(); gs(57); cl(); gs(62)
cl(); gs(12); fdn(4)
# Body
qtr(); fdn(9); cl(); cl(); fdn(31); ht(); etr()
fdn(2); etl(); fdn(14)
# Go to the antenna
pu(); fdn(10); pd(); fdn(4)
# Antenna
etr(); fd(); gs(2); cl(); cl(); cl(); cl()
gs(12); ht(); fd()
# Eye
etr(); pu(); fd(); pd(); gs(2); cl(); cl()
cl(); cl(); st()
