from LibRobot import *

# Pattern by S. Horemis, 'Optical and geometrical
# patterns and designs', Dover, New York, 1970.
n = 6
twoToTheN = 64  # 2 to the power n

gb(); gl(); gs(twoToTheN)
for i in range(n):
    for j in range(4):
        fdn(4); qtr()
    fdn(2); etr()
    for j in range(4):
        fdn(2); fdn(-1); qtr(); paint(); qtl()
        fd(); qtr()
    fd(); etr()
    gs(valGsX() / 2)
st()
