from LibRobot import *

# Draw a 90-degree spirolateral of order 9 by
# Frank C. Odds.
pu(); fdn(-4); pd()
for i in range(4):
    for j in range(1, 10):
        fdn(j); qtr()
st()
