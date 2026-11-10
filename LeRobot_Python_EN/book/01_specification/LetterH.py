# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Capital letter H in relief, page 9.                 *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw the capital letter H
# Start of the bottom left branch
fd(); fd(); fd(); fd(); fd()
# Top left branch
fd(); fd(); fd(); fd(); fd()
qtr(); fd(); fd(); etl(); fd(); etl(); qtl(); fd(); fd(); etl(); fd()
etl(); qtl(); fd(); fd()
qtr(); fd(); fd(); fd(); fd(); qtl(); fd(); fd(); qtl(); qtl(); fd()
fd(); qtr(); etr(); fd()
etl(); fd(); fd(); fd(); fd(); qtr(); qtr(); fd(); fd(); fd(); fd()
# Top of the bridge
qtl(); fd(); qtr(); fd()
# Right branch
qtl(); qtl(); fd(); fd(); fd(); fd(); etr(); fd(); etr(); fd(); fd()
qtr(); etr(); fd()
etr(); fd(); fd(); qtr(); qtr(); fd(); fd(); qtr(); fd(); fd(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); fd()
qtl(); etl(); fd(); etl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); qtl(); etl()
fd(); etl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
qtr(); fd(); fd(); qtr(); fd()
fd(); fd(); fd()
# Bottom of the bridge
qtl(); fd(); fd(); qtl()
# End of the bottom left branch
fd(); fd(); fd(); fd(); qtr(); fd(); fd(); qtr(); qtr()
fd(); fd(); etl(); fd(); etl(); fd(); fd(); fd(); st()
