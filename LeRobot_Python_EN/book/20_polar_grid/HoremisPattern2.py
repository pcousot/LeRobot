from LibRobot import *

# Geometric pattern after Horemis
gs(65)
for i in range(12):
    gc(); pu(); fd(); qtr(); pd()
    for j in range(4):
        fd(); qtr(); fd()
    cr(); cr(); cr(); cr()
    for j in range(4):
        fd(); etl(); paint(); tetr(); fd()
    gsRT(valGsX(), 45)
st()
