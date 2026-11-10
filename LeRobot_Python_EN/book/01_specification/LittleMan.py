# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Little man, page 9.                                 *
# *                                                     *
# *******************************************************
from LibRobot import *

# Belt
qtr(); fd(); fd(); ht(); fd(); fd(); fd(); fd(); ht(); fd(); fd()
# Crotch
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Left foot (on the right)
qtl(); fd(); fd(); qtr(); cr(); cr(); ht()
# Right foot (on the left)
qtr(); fd(); fd(); qtl(); cl(); cl()
# Finish the right leg (on the left)
qtr(); fd(); fd(); qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Right arm (on the left)
# Left edge of the arm
fd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); fd(); fd()
# Hand
qtl(); fd(); qtr(); cr(); qtr(); fd(); qtr(); fd()
# Right edge of the arm
qtl(); fd(); fd(); fd(); fd(); fd(); fd()
# Right shoulder (on the left)
cl(); fd(); fd()
# Head
cr(); fd(); qtr(); fd(); ht(); fd(); fd(); ht(); cl(); cr(); cr(); cl()
ht(); fd(); fd(); ht(); fd(); qtr(); fd(); cr()
# Left shoulder (on the right)
fd(); fd(); cl()
# Left arm (on the right)
# Left edge of the arm
fd(); fd(); fd(); fd(); fd(); fd()
# Hand
qtl(); fd(); qtr(); fd(); qtr(); cr(); qtr(); fd()
# Right edge of the arm
qtl(); fd(); fd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); fd()
# Finish the left leg (on the left)
fd(); fd(); fd(); fd(); fd(); fd(); fd()
st()
