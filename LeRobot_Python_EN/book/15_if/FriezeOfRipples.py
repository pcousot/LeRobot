from LibRobot import *

# Draw a frieze of ripples
length = 15

gl()
for i in range(2 * length):
    if tn():
        cr(); qtr()
    elif ts():
        cl(); qtl()
    elif te():
        qtr()
    else:
        qtl()
    fd()
st()
