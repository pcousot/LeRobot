# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Stylized flower, page 9.                            *
# *                                                     *
# *******************************************************
from LibRobot import *

def petal():
    etr(); fd(); fd(); tetr(); fd(); fd(); qtr(); fd(); fd()

def leaf():
    fd(); fd(); tetl(); fd(); fd(); qtl(); fd(); fd()

# Go up
pu(); fd(); fd(); pd()
# Draw the petals
for p in range(4):
    petal()
ht()
# Draw the stem
for j in range(11):
    fd()
# Draw the leaf
ht(); fd(); fd(); fd(); fd(); etr(); fd(); fd(); leaf()
st()
