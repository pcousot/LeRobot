from LibRobot import *

# Draw a row of stakes in a sawtooth pattern
gl()
for i in range(1, 41):
    for j in range(2):
        for k in range(1 + (i - 1) % 5):
            fd()
        ht()
    qtr(); fd(); qtl()
st()
