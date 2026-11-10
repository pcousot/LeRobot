# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Quadrilaterals, page 9.                             *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a triangle, a trapezoid, a parallelogram, a rectangle and a square
gl(); qtl()
# Next figure
pu(); ht(); fd(); fd(); fd(); fd(); fd(); pd()
# Trapezoid
etl(); fd(); fd(); etr(); fd(); fd(); etr(); fd(); fd(); tetr(); fd()
fd(); fd(); fd(); fd(); fd()
# Next figure
pu(); ht(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); pd()
# Parallelogram
etl(); fd(); fd(); etr(); fd(); fd(); fd(); tetr(); fd(); fd(); etr()
fd(); fd(); fd()
# Next figure
pu(); ht(); fd(); fd(); fd(); fd(); fd(); fd(); pd()
# Rectangle
fd(); fd(); fd(); qtl(); fd(); fd(); qtl(); fd(); fd(); fd(); qtl(); fd()
fd(); qtr()
# Next figure
pu(); ht(); fd(); fd(); fd(); fd(); pd()
# Rectangle
fd(); fd(); qtl(); fd(); fd(); qtl(); fd(); fd(); qtl(); fd(); fd()
qtr()
st()
