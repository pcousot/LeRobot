# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Means of transport, page 10.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a truck
def t():
    # Draw the letter "T"
    pu(); qtr(); fd(); qtl(); pd(); fd(); fd(); qtl(); fd(); ht(); fd(); fd()
    pu(); qtr(); fd(); fd(); qtl(); fd(); qtl(); pd()

def r():
    # Draw the letter "R"
    fd(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); qtl(); cl(); pu()
    fd(); pd(); qtl()

def a():
    # Draw the letter "A"
    fd(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); ht(); fd(); qtr()
    fd(); pu(); qtl(); fd(); qtl(); pd()

def n():
    # Draw the letter "N"
    fd(); fd(); ht(); cl(); qtl(); fd(); ht(); fd(); fd(); pu(); qtl(); fd()
    qtl(); pd()

def s():
    # Draw the letter "S"
    qtr(); fd(); qtl(); fd(); qtl(); fd(); qtr(); fd(); qtr(); fd(); pu()
    qtr(); fd(); fd(); qtl(); fd(); qtl(); pd()

def p():
    # Draw the letter "P"
    fd(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); pu(); qtl(); fd()
    qtl(); fd(); fd(); qtl(); pd()

def o():
    # Draw the letter "O"
    fd(); fd(); qtr(); fd(); qtr(); fd(); fd(); qtr(); fd(); pu(); ht(); fd()
    fd(); qtl(); pd()

def transport():
    # Draw the word "TRANSPORT"
    t(); r(); a(); n(); s(); p(); o(); r(); t()

# Truck
# Go up to the top of the page
pu(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); pd()
# Draw the roof of the truck
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); fd(); qtr()
cr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); cr()
qtr(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Draw the back of the truck
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
qtr(); fd(); ht(); fd(); fd(); fd(); fd()
# Draw the rear wheels of the truck
qtl(); fd(); cr(); fd(); fd(); fd(); fd(); fd(); cr(); fd(); pu(); qtr()
fd(); fd(); fd(); fd(); fd(); fd(); qtr(); pd()
cr(); cr(); cr(); cr(); qtr(); pu(); fd(); fd(); fd(); qtl(); pd(); cr()
cr(); cr(); cr(); pu(); cr(); cr(); qtl(); fd(); pd()
# Draw the underside of the truck
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd(); qtl(); fd(); cr(); qtl()
# Draw the door of the truck's cab
fd(); fd(); fd(); fd(); fd(); fd(); fd(); qtr(); fd(); fd(); cr(); fd()
fd(); qtr(); fd(); fd(); fd(); ht()
fd(); fd(); fd(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); ht()
# Draw the front wheel of the truck
fd(); cl(); fd(); fd(); pu(); qtl(); fd(); fd(); ht(); pd(); cr(); cr()
cr(); cr(); pu(); fd(); fd(); pd(); qtr(); fd(); fd(); cr(); fd()
# Draw the cab of the truck
qtl(); fd(); fd(); ht(); fd(); qtr(); fd(); fd(); qtr(); fd(); qtl()
fd(); qtl(); fd(); qtr(); fd(); fd(); fd(); fd(); fd(); fd(); cl(); fd()
fd()
fd(); qtr(); fd(); fd(); qtr(); fd(); qtr(); fd(); fd(); qtr(); fd()
fd(); fd(); qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd()
# Go round the body of the truck
ht(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
qtl(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
fd()
fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
# Go to the first letter without drawing
pu(); qtl(); fd(); fd(); fd(); fd(); qtl(); fd(); qtl()
# Write "transport" on the body of the truck
transport()
st()
# Truck
