from LibRobot import *

# Draw a frieze shaped like a double comb
numberOfTeeth = 30

gl(); fe()
for i in range(1, numberOfTeeth + 1):
    # Horizontal line
    fd()
    if i % 2 == 1:
        # Tooth pointing down
        qtr(); fd(); ht(); fd(); qtr()
    # Tooth pointing up
    else:
        qtl(); fd(); ht(); fd(); qtl()
st()
