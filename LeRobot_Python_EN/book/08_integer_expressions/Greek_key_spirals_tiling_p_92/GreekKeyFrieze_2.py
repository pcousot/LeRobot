from LibRobot import *

# Draw a Greek key frieze with nested
# loops
gl()
for i in range(8):
    for j in range(4):
        fd()
    qtr()
    for j in range(1, 5):
        for k in range(5 - j):
            fd()
        qtr()
    fd(); qtl()
    for j in range(1, 5):
        for k in range(j):
            fd()
        qtl()
st()
