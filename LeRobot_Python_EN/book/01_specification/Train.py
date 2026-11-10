# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Means of transport, page 10.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a steam train with tender and two passenger carriages
def wheel():
    cl(); cl(); cl(); cl()

def locomotive():
    # Front
    fdn(2); qtl(); fdn(3); qtl(); fd(); qtl(); fdn(3); qtl(); fd(); qtr()
    fd()
    ht()
    fdn(5)
    # Body
    qtr(); fd(); qtl(); fdn(2); qtr(); fd(); qtr(); fdn(2); qtr(); fd()
    ht()
    fdn(11)
    qtr(); fdn(5); qtr(); fdn(6); wheel(); fdn(3); wheel(); fdn(3); ht()
    fdn(12)
    # Cab
    qtl(); fdn(8); qtr(); fd()
    # Window
    qtr(); pu(); fd(); pd(); fdn(3); qtl(); fdn(2); qtl(); fdn(2); etl()
    fd()
    etl()
    fd(); qtr(); pu(); fd(); pd(); qtr()
    fdn(2); etr(); fdn(3); etr(); fd(); qtl(); fd(); qtr(); fdn(4); qtr()
    fdn(2)
    wheel(); fdn(3); wheel(); fdn(2); ht(); fdn(7); qtl(); fd(); qtr(); fd()

def tender():
    fd(); qtl(); fdn(3); qtr(); fdn(2); etl(); fdn(2); etr(); fdn(5); qtr()
    fdn(6)
    qtr(); fdn(2); wheel(); fdn(5); wheel(); fdn(2); qtr(); fd(); qtr(); pu()
    fdn(9)
    pd()
    fd()

def window():
    qtr(); pu(); fd(); pd(); fdn(3); qtl(); fdn(2); qtl(); fdn(3); qtl()
    fdn(2)
    pu()
    qtr(); fd(); qtr(); pd()

def door():
    qtr(); pu(); fd(); pd(); fdn(4); pu(); qtl(); fd(); dc(); ht(); fd()
    qtl()
    pd(); fdn(3)
    qtl(); fdn(3); qtl(); fdn(7); qtl(); fdn(3); pu(); qtr(); fd(); qtr()
    pd()

def carriage():
    fd(); fd(); qtr(); fd(); ht(); fdn(8); qtl(); fd(); ht(); fdn(2)
    window()
    fdn(3)
    window(); fdn(3); door(); fdn(4); window(); fdn(3); window(); fdn(4)
    ht()
    fd(); qtl(); fdn(8); qtr(); fdn(3); wheel(); fdn(11); wheel(); fdn(3); ht()
    fdn(17); qtl(); fd(); qtr(); fd()

gs(6); gl(); qtr(); locomotive(); tender(); carriage(); carriage(); st()
