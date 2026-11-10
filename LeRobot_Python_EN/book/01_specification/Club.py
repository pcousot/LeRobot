# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Some simple geometric drawings, page 6.             *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw the suit 'Clubs'
# Top leaf
etr(); cl(); cl(); cl()
# Right leaf
pu(); fd(); pd(); cl(); cl(); cl()
# Left leaf
pu(); fd(); pd(); cr(); cr(); cr()
# Stem
etr(); pu(); fd(); etl(); pd()
cr(); tetl(); fd(); tetl(); cr()
st()
