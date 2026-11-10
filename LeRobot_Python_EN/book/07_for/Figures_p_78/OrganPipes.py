from LibRobot import *

# Draw organ pipes
qtr()
for i in range(1, 11):
    fd(); qtl()
    for j in range(i):
        fd()
    qtr(); fd(); qtr()
    for j in range(i):
        fd()
    qtl()
st()
