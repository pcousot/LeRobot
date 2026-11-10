from LibRobot import *

# Draw a Greek key frieze
gl()
for i in range(8):
    fd(); fd(); fd(); fd(); qtr()
    fd(); fd(); fd(); fd(); qtr()
    fd(); fd(); fd(); qtr()
    fd(); fd(); qtr()
    fd(); qtr()
    fd(); qtl()
    fd(); qtl()
    fd(); fd(); qtl()
    fd(); fd(); fd(); qtl()
    fd(); fd(); fd(); fd(); qtl()
st()
