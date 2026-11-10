from LibRobot import *

# Go to the tip of the tail
# Down
pu(); qtr(); qtr(); fd(); fd(); fd(); fd(); fd()
fd(); fd()
# On the right
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); qtl(); pd()
# Top of the tail
fd(); qtr(); cl(); qtl(); cl(); qtr(); qtr()
# 1st tail spike
cl(); qtr(); qtr(); cl(); qtl(); cl(); qtr()
# 2nd tail spike
cr(); cl(); fd()
# Draw the 11 bony back plates from back to front
# 1
cr(); fd(); fd(); fd(); qtr(); fd(); qtr(); fd()
fd(); fd(); fd(); qtr(); cr(); fd()
# 2
qtl(); cr(); fd(); fd(); fd(); qtr(); fd()
qtr(); fd(); fd(); qtr(); pu(); fd(); pd()
# 3
cr(); fd(); fd(); qtr(); fd(); qtr(); fd()
qtr(); pu(); fd(); pd()
# 4
cr(); qtl(); fd(); qtr(); fd(); qtr(); fd()
fd(); qtr(); fd(); fd(); qtr(); cr(); qtl()
fd()
# 5
fd(); cr(); fd(); qtr(); fd(); fd(); qtr(); fd()
fd(); qtr(); fd(); cr(); qtl()
# 6
fd(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd()
qtr(); fd(); fd(); qtr(); fd(); fd(); qtl()
# 7
cr(); fd(); qtr(); fd(); fd(); qtr(); fd(); fd()
qtr(); fd(); cr(); fd()
# 8
fd(); qtl(); cr(); qtr(); fd(); fd(); qtr()
fd(); fd(); qtr(); fd(); qtr(); fd(); qtl()
cr()
# 9
cl(); qtr(); qtr(); fd(); fd(); qtr(); fd()
qtr(); fd(); qtr(); cl()
# 10
cl(); cl(); qtr(); qtr(); fd(); fd(); fd()  # ERROR: cr
qtr(); fd(); fd(); qtr(); fd(); cr(); cl()
# 11
fd(); cr(); qtr(); fd(); fd(); fd(); qtr(); fd()
qtr(); fd(); fd(); cr()
# Draw the head
# Skull
fd(); fd()
# Eye
pu(); qtl(); fd(); dc(); qtr(); qtr(); fd()
qtl(); pd()
# Forehead
cl(); cr()
# Top of the snout
fd(); cl()
# Mouth
qtl(); fd(); fd(); qtr(); qtr(); fd(); fd()
qtl()
# Underside of the head
cl(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
cl(); qtr(); fd()
# Draw the front legs
# Left leg
qtl(); fd(); fd(); fd(); qtr(); qtr(); fd()
fd(); fd(); fd(); fd(); qtl(); fd(); fd(); qtl()
fd(); fd(); fd(); fd(); fd(); fd(); qtr(); qtr()
fd(); fd(); fd()
# Right leg
fd(); fd(); qtl(); fd(); qtl(); fd(); fd()
qtl(); fd(); qtr(); qtr(); fd()
# Draw the belly
cl(); qtl(); fd(); fd(); fd()  # ERROR: qtr
# Draw the hind legs
# Left leg
qtl(); fd(); fd(); fd(); qtr(); qtr(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); qtl(); fd()
fd(); qtl(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); qtr(); qtr(); fd(); fd(); fd(); fd()
fd(); fd()
# Right leg
fd(); qtl(); fd(); qtl(); fd(); fd(); fd()
qtl(); fd(); qtr(); qtr(); fd()
# Complete the underside of the tail
fd(); qtr(); cl(); fd(); cr(); cl(); fd(); qtr()
cl(); qtr(); st()
