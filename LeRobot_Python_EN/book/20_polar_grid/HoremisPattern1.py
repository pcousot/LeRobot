from LibRobot import *

# Geometric pattern after Horemis
gs(62)
for i in range(9):
    gc(); pu(); fd(); qtr(); pd()
    for j in range(4):
        fd(); qtr(); fd()
    cr(); cr(); cr(); cr()
    for j in range(4):
        fd(); etl(); paint(); tetr(); fd()
    gsRT(valGsX(), 45); etr()
    gc(); pu(); fd(); qtr(); pd()
    for j in range(4):
        fd(); qtr(); fd()
    for j in range(4):
        fd(); etl(); paint(); tetr(); fd()
    etl()
st()
