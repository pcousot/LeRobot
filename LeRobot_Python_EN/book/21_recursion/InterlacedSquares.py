from LibRobot import *

# Interlaced squares
def squares(l):
    if l > 2:
        # Draw a square of side l starting from the centre
        gs(l / 2); pu(); fd(); qtr()
        pd(); fd(); qtr(); fdn(2); qtr(); fdn(2); qtr()
        fdn(2); qtr(); fd(); qtr()
        pu(); fd(); ht()
        # Nest four squares
        for i in range(4):
            gs(l / 3); pu(); fd()
            squares(l / 3)
            gs(l / 3); pu(); fdn(-1)
            qtr()

squares(170); st()
