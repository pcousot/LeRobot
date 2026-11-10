from LibRobot import *

# Effect of fd () with thicker and thicker
# pens
pu(); fdn(5); qtr(); gsX(6); fdn(-1); gsX(12)
for i in range(1, 5):
    pu(); qtr(); fdn(i); qtl(); pd()
    pw(12 * i); fd(); pu(); fdn(-1)
dg(); st()
