from LibRobot import *

# Draw a frieze of rhombuses and Z's
gl()
for m in range(14):
    # Rhombus
    fd(); etr(); fd(); tetr(); fd(); etr()
    fd(); tetr(); fd(); etr(); fd(); etr()
    # Upright Z
    fd(); qtr(); fd(); fd(); qtl(); fd(); qtl()
st()
