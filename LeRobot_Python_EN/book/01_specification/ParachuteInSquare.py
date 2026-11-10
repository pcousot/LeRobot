# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Some simple geometric drawings, page 6.             *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a parachute in a square
# Parachute
cr(); qtl(); cl(); cl(); qtl(); cr()
# Square
qtl(); fd(); qtl(); fd(); fd(); qtl(); fd(); fd(); qtl(); fd(); fd()
qtl(); fd()
st()
