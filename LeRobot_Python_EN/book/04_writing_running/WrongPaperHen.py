"""Draw an origami paper hen facing west

# Back
etr(); fd(); fd(); fd(); fd()
rtl(); fd(); fd(); fd(); fd()
# Top
qtr(); fd(); fd(); fd(); fd(); qtr(); etr()
# Front
fd(); fd(); qtl(); fd(); fd()
etr(); fd(); fd(); fd(); fd()
# Bottom
qtr(); etr(); fd(); fd(); qtl(); fd(); fd()
etr(); fd(); fd(); fd(); fd()
# Stopping the robot
st(
