# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Digital digits, page 8.                             *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw the digits 0 to 9, the robot starting at the bottom
# left of the digit and ending in the same position
# for the next digit:
def d0():
    # Draw the digit 0
    pd(); fd(); fd(); qtr(); fd(); qtr(); fd(); fd(); qtr(); fd()
    pu(); ht(); fd(); fd(); qtl()

def d1():
    # Draw the digit 1
    pd(); fd(); fd(); pu(); qtr(); fd(); qtr(); fd(); fd(); ht()

def d2():
    # Draw the digit 2
    pu(); fd(); fd(); qtr(); pd(); fd(); qtr(); fd(); qtr(); fd(); qtl()
    fd()
    qtl(); fd(); pu(); fd(); qtl()

def d3():
    # Draw the digit 3
    pu(); fd(); fd(); qtr(); pd(); fd(); qtr(); fd(); qtr(); fd(); ht(); fd()
    qtr(); fd(); qtr(); fd(); pu(); ht(); fd(); fd(); qtl()

def d4():
    # Draw the digit 4
    pu(); fd(); fd(); ht(); pd(); fd(); qtl(); fd(); qtl(); fd(); ht(); fd()
    fd()
    pu(); qtl(); fd(); qtl()

def d5():
    # Draw the digit 5
    pd(); qtr(); fd(); qtl(); fd(); qtl(); fd(); qtr(); fd(); qtr(); fd()
    pu(); fd(); qtr(); fd(); fd(); ht()

def d6():
    # Draw the digit 6
    pd(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); fd()
    qtr()
    fd(); pu(); fd(); qtr(); fd(); fd(); ht()

def d7():
    # Draw the digit 7
    pu(); fd(); fd(); qtr(); pd(); fd(); qtr(); fd(); fd(); qtr()
    pu(); ht(); fd(); qtl()

def d8():
    # Draw the digit 8
    pd(); fd(); qtr(); fd(); ht(); fd(); qtr(); fd(); qtr(); fd(); qtr()
    fd()
    fd(); qtr(); fd(); pu(); ht(); fd(); fd(); qtl()

def d9():
    # Draw the digit 9
    pu(); fd(); pd(); qtr(); fd(); ht(); fd(); qtr(); fd(); qtr(); fd()
    qtr()
    fd(); fd(); qtr(); fd(); pu(); ht(); fd(); fd(); qtl()

# DigitalWatchDigits
gl(); d0(); d1(); d2(); d3(); d4(); d5(); d6(); d7(); d8(); d9()
st()
# DigitalWatchDigits
