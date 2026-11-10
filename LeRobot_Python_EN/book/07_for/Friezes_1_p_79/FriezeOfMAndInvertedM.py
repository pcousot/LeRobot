from LibRobot import *

# Draw a frieze of M's and inverted M's
gl(); etr()
for i in range(10):
    # Draw a pattern | |/\
    tetr(); fd(); fd(); tetl(); fd(); qtr()
    fd()
    # Draw a pattern |\/ |
    tetl(); fd(); fd(); tetr(); fd(); qtl()
    fd()
# Finish the last branch | |
tetr(); fd(); fd(); st()
