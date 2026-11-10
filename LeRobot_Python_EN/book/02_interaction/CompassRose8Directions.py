# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Eight-point compass rose, page 14.                  *
# *                                                     *
# *******************************************************
from LibRobot import *

i = 0

# N branch
gc(); fn(); gsY(60); fd()  # central axis
label(" N")
gc(); fnw(); gsY(12); fd(); qtr(); gsY(60); fd(); qtr(); fd(); gsY(12)
qtr()
fd()
# S branch
gc(); fs(); fd(); gsY(60); fd()  # central axis
label(" S")
gc(); fsw(); gsY(12); fd(); qtl(); gsY(60); fd(); qtl(); fd(); gsY(12)
qtl()
fd()
# W branch
gc(); fw(); fd(); gsX(60); fd()  # central axis
pu(); gsX(12); fd(); label("W"); ht(); fd(); ht(); gsX(60); pd()
ht(); fd(); gsX(12); fd(); ht()
gc(); fsw(); gsX(12); fd(); qtr(); gsX(60); fd(); qtr(); fd(); gsX(12)
qtr()
fd()
# E branch
gc(); fe(); fd(); gsX(60); fd()  # central axis
label(" E")
gc(); fse(); gsX(12); fd(); qtl(); gsX(60); fd(); qtl(); fd(); gsX(12)
qtl()
fd()
# NW branch
gc(); fnw(); gsX(40); gsY(40); fd()
pu(); gs(6); fd(); label("NW"); ht(); fd(); pd()
fse(); gsX(20); gsY(30); fd(); ht(); fd()
fse(); gsX(30); gsY(20); fd(); ht(); fd()
# NE branch
gc(); fne(); gsX(40); gsY(40); fd()
pu(); gs(6); fd(); label("NE"); ht(); fd(); pd()
fsw(); gsX(20); gsY(30); fd(); ht(); fd()
fsw(); gsX(30); gsY(20); fd(); ht(); fd()
# SE branch
gc(); fse(); gsX(40); gsY(40); fd()
pu(); gs(6); fd(); label("SE"); ht(); fd(); pd()
fnw(); gsX(20); gsY(30); fd(); ht(); fd()
fnw(); gsX(30); gsY(20); fd(); ht(); fd()
# SW branch
gc(); fsw(); gsX(40); gsY(40); fd()
pu(); gs(6); fd(); fw(); fd(); fd(); label("SW"); ht(); fd(); fd(); fne()
fd(); pd()
fne(); gsX(20); gsY(30); fd(); ht(); fd()
fne(); gsX(30); gsY(20); fd(); ht(); fd()
gc(); fn(); st()
