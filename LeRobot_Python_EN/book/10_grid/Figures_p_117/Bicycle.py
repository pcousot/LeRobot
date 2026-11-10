from LibRobot import *

# Draw a bicycle
pw(2)
# Front wheel
gs(36); pu(); qtr(); fd(); pd(); cl(); cl()
cl(); cl(); pu(); qtl()
fd(); qtr(); pd()
# Front fork
gsX(6); gsY(10); etl(); fdn(6)
# Handlebars
etr(); fd(); ht(); fd(); gs(8); cr(); cr()
ht(); cl(); cl()
gsX(6); gsY(10); tetr(); fd(); tetl()
# Top tube of the frame
fdn(14)
# Saddle
etl(); fd(); etr(); fd(); ht(); fdn(5); ht()
fdn(4); tetr(); fd(); fdn(5)
# Crankset
pu(); etr(); gs(12); fd(); pd(); qtr(); cr()
cr(); cr(); cr(); pu()
qtr(); fd(); gsX(6); gsY(10); pd()
# Down tube of the frame
fdn(10)
# Rear wheel
gs(36); pu(); fd(); pd(); qtl(); cl(); cl()
cl(); cl(); qtl()
pu(); fd(); pd()
# Cross tubes
gsX(6); gsY(10); etr(); fdn(5); qtl(); fdn(5)
qtr(); gsX(9); gsY(8); fdn(6); st()
