# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# *                                                     *
# *******************************************************
from LibRobot import *

backgroundColour = white
digitColour = black

def dig(c):
    # Draw the digit C, the robot starting at the bottom left and ending
    # in the same position
    pd(); fn()
    if c == 0:
        fdn(2); qtr(); fd(); qtr(); fdn(2); qtr(); fd(); qtr()
    elif c == 1:
        pu(); qtr(); fd(); qtl(); fdn(2); ht(); pd(); fdn(2); pu(); qtr(); fd()
        qtr()
    elif c == 2:
        pu(); fdn(2); qtr(); pd(); fd(); qtr(); fd(); qtr(); fd(); qtl(); fd()
        qtl(); fd(); ht(); fd(); qtr()
    elif c == 3:
        pu(); fdn(2); qtr(); pd(); fd(); qtr(); fd(); qtr(); fd(); ht(); fd()
        qtr(); fd(); qtr(); fd(); qtr()
    elif c == 4:
        pu(); fdn(2); ht(); pd(); fd(); qtl(); fd(); qtl(); fd(); ht(); fdn(2)
        pu()
        qtr(); fd(); qtr()
    elif c == 5:
        qtr(); fd(); qtl(); fd(); qtl(); fd(); qtr(); fd(); qtr(); fd(); pu()
        qtr(); fdn(2); qtr(); fd(); qtr()
    elif c == 6:
        fd(); qtr(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fdn(2); qtr(); fd()
        pu(); qtr(); fdn(2); qtr(); fd(); qtr()
    elif c == 7:
        pu(); fdn(2); qtr(); pd(); fd(); qtr(); fdn(2); qtr(); pu(); fd(); qtr()
    elif c == 8:
        fd(); qtr(); fd(); ht(); fd(); qtr(); fd(); qtr(); fd(); qtr(); fdn(2)
        qtr(); fd(); qtr()
    elif c == 9:
        pu(); fd(); pd(); qtr(); fd(); ht(); fd(); qtr(); fd(); qtr(); fd()
        qtr(); fdn(2); qtr(); fd(); qtr()
    else:
        pass

def space():
    # Leave a space between two numbers
    pu(); fe(); fdn(2)

def minus():
    # Draw a - sign
    fn(); pu(); fd(); qtr(); pd(); fd(); pu(); qtr(); fd(); qtr(); fd()
    qtr()

def num(n):
    # Draw the number N (assuming -32767 <= N <= 32767)
    if 0 <= n and n <= 9:
        dig(n)
    elif n < 0:
        minus(); space(); num(-n)
    else:
        num(n // 10); space(); num(n % 10)

def colon():
    pu(); dp(); fn(); fd(); dp(); ht(); fd()

def writeDate(d, mo, y):
    # Write the day
    gc(); gl(); translate(0, 2); num(d)
    # Write -
    gc(); gl(); translate(4, 2); minus()
    # Write the month
    gc(); gl(); translate(6, 2); num(mo)
    # Write -
    gc(); gl(); translate(10, 2); minus()
    # Write the year
    gc(); gl(); translate(12, 2); num(y)

def writeSecond(s):
    # Write the second
    gc(); gl(); translate(10, -2); num(s)

def writeTime(h, mi, s):
    # Write the hour
    gc(); gl(); translate(0, -2); num(h)
    # Write :
    gc(); gl(); translate(4, -2); colon()
    # Write the minute
    gc(); gl(); translate(5, -2); num(mi)
    # Write :
    gc(); gl(); translate(9, -2); colon()
    # Write the second
    writeSecond(s)

def initialise():
    bg(backgroundColour); pc(digitColour)
    hideRobot()
    message("Stop the clock by pressing one of the keys 'esc', '§' or '#'.")
    gs(24); pw(6)

aD = 0
aMo = 0
aY = 0
aH = 0
aMi = 0
aS = 0
d = 0
mo = 0
y = 0
h = 0
mi = 0
s = 0

aY, aMo, aD = date(); aH, aMi, aS = clock()
initialise(); writeDate(aY, aMo, aD); writeTime(aH, aMi, aS)
while True:
    while True:  # repeat ... until
        y, mo, d = date(); h, mi, s = clock()
        if s != aS:
            break
    if aMi == mi:
        pc(backgroundColour); writeSecond(aS)  # Erase the old second
        pc(digitColour); writeSecond(s)  # Write the new second
    # Every minute, clear the screen and rewrite the whole date
    else:
        initialise(); writeDate(y, mo, d); writeTime(h, mi, s)
    aY = y; aMo = mo; aD = d; aH = h; aMi = mi; aS = s
st()
