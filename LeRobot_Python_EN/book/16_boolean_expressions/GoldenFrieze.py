from LibRobot import *

# Draw a golden frieze
length = 31

gl()
for i in range(length):
    if tn() or te():
        cr()
    else:
        fdn(-1); cl(); qtl()
st()
