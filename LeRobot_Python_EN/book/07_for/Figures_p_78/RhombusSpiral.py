from LibRobot import *

# Draw a spiral of rhombuses
etr()
for i in range(1, 11):
    for j in range(2):
        for k in range(i):
            fd()
        qtr()
st()
