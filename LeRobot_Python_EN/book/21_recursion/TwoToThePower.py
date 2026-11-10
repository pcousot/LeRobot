from LibRobot import *

# Compute 2 to the power 16 and draw the
# result with the robot
def twoToThePower(n):
    if n == 0:
        return 1
    else:
        return 2 * twoToThePower(n - 1)

# Draw the digit c, the robot starting at the bottom
# left and ending in the same position
def digit(c):
    pd(); fn()
    if c == 0:
        fd(); fd(); qtr(); fd(); qtr(); fd(); fd()
        qtr(); fd(); qtr()
    elif c == 1:
        pu(); qtr(); fd(); qtl(); fd(); fd()
        ht(); pd(); fd(); fd(); pu(); qtr()
        fd(); qtr()
    elif c == 2:
        pu(); fd(); fd(); qtr(); pd(); fd(); qtr()
        fd(); qtr(); fd(); qtl()
        fd(); qtl(); fd(); ht(); fd(); qtr()
    elif c == 3:
        pu(); fd(); fd(); qtr(); pd(); fd(); qtr()
        fd(); qtr(); fd(); ht(); fd()
        qtr(); fd(); qtr(); fd(); qtr()
    elif c == 4:
        pu(); fd(); fd(); ht(); pd(); fd(); qtl()
        fd(); qtl(); fd(); ht(); fd()
        fd(); pu(); qtr(); fd(); qtr()
    elif c == 5:
        qtr(); fd(); qtl(); fd(); qtl(); fd()
        qtr(); fd(); qtr(); fd(); pu()
        qtr(); fd(); fd(); qtr(); fd(); qtr()
    elif c == 6:
        fd(); qtr(); fd(); qtr(); fd(); qtr()
        fd(); qtr(); fd(); fd(); qtr()
        fd(); pu(); qtr(); fd(); fd(); qtr(); fd()
        qtr()
    elif c == 7:
        pu(); fd(); fd(); qtr(); pd(); fd(); qtr()
        fd(); fd(); qtr(); pu(); fd()
        qtr()
    elif c == 8:
        fd(); qtr(); fd(); ht(); fd(); qtr()
        fd(); qtr(); fd(); qtr(); fd()
        fd(); qtr(); fd(); qtr()
    elif c == 9:
        pu(); fd(); pd(); qtr(); fd(); ht(); fd()
        qtr(); fd(); qtr(); fd()
        qtr(); fd(); fd(); qtr(); fd(); qtr()
    else:
        pass

# Leave a space between two numbers
def space():
    pu(); fe(); fd(); fd()

# Draw a - sign
def minus():
    fn(); pu(); fd(); qtr(); pd(); fd(); pu()
    qtr(); fd(); qtr(); fd(); qtr()

# Draw the number n
def number(n):
    if 0 <= n and n <= 9:
        digit(n)
    elif n < 0:
        minus(); space(); number(-n)
    else:
        number(n // 10); space()
        number(n % 10)

gl(); number(twoToThePower(16)); st()
