# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Means of transport, page 10.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a helicopter
# Rotor and blades
fdn(2); qtl(); fdn(13); ht(); fdn(26); ht(); fdn(14); qtl(); fdn(2)
# Right half of the roof of the cabin
qtl(); fdn(5); etr(); fd(); etr(); fd()
# Tail
qtl(); fdn(12); qtl(); fdn(2); qtr(); fdn(2); qtr(); fd()
# Tail rotor
pu(); qtr(); fd(); pd()
etl(); fdn(2); ht(); fdn(4); ht(); fdn(2); qtr(); fdn(2); ht(); fdn(4)
ht()
fdn(2)
pu(); tetr(); fd(); qtr(); pd()
fdn(3); qtr(); fdn(14)
# Back of the cabin
qtr(); fdn(2); ht(); fdn(4); etr(); fd(); etr()
# Underside of the cabin
fdn(3); qtl()
# Landing skids
fdn(2); qtl(); fdn(4); etl(); fd(); ht(); fd(); etr(); fdn(14); etr()
fd()
ht(); fd(); etl()
fdn(4); qtl(); fdn(2)
qtr(); fdn(6); ht(); fdn(8)
# Door
qtr(); fdn(4); etr(); fd(); etr(); fd(); etr(); fd(); etr(); fdn(4)
qtr()
fdn(5)
# Front of the cabin
etr(); fdn(2); etr(); fdn(3)
pu(); qtr(); fdn(2); dc(); ht(); fdn(2); pd()
tetr(); fdn(2)
# Left half of the roof of the cabin
etr(); fdn(8)
st()
