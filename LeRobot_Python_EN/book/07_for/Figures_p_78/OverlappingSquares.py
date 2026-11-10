from LibRobot import *

# Draw overlapping squares
gb(); gl()
for i in range(1, 15):
    for j in range(4):
        for k in range(i):
            fd()
        qtr()
st()
