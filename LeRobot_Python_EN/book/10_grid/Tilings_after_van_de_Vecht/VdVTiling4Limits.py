from LibRobot import *

# Irregular tiling in the style of M. C. Escher,
# inspired by a pattern of N. J. van de Vecht.

# Pattern of N. J. van de Vecht, the robot starting
# at the top left and arriving at the bottom left
# facing north.
def pattern():
    qtr(); fdn(4); qtr(); fdn(3); qtr(); fd(); qtr()
    fdn(3); ht(); fdn(3)
    fd(); qtr(); fd(); qtl(); fd(); qtl(); fd()
    qtr(); fd(); qtr(); fdn(3)
    qtr(); fd(); qtr(); fd(); qtl(); fd(); qtl()
    fd(); qtr(); fd(); qtr(); fdn(3)
    ht(); fdn(3); qtr(); fdn(3); pu(); ht(); fdn(6)
    ht(); pd()

# Draw a column of patterns of heights 2, 4, 6,
# 8, 10, 8, 6, 4, 2, the robot starting at the top left
# and arriving at the bottom right (that is, at the
# bottom left of the next column) facing north.
def column():
    gsY(1); gt()
    for i in range(1, 6):
        gsY(2 * i); pattern()
    for i in range(1, 5):
        gsY(10 - 2 * i); pattern()
    qtr(); fdn(4); qtl()

# Draw an irregular tiling made of columns
# of widths 0, 2, 4, 6, ..., 14, 16, 14, ..., 2, 0.
def tiling():
    gsX(1); gl(); gsX(0)
    for i in range(1, 9):
        column(); gsX(2 * i)
    for i in range(1, 9):
        column(); gsX(16 - 2 * i)
    column()

tiling(); st()
