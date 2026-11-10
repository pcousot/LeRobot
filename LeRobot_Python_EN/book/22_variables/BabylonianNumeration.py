from LibRobot import *

# Write a number in Babylonian numeration
x = 6  # Grid size

# Head of a nail
def nailHead():
    pu(); qtr(); fd(); qtl(); pd()
    gsY(valGsY() * 2); cl(); fdn(-2); cl()
    pu(); qtl(); fd(); qtl(); pd()
    gs(x)

# Nail whose point has height n
def one(n):
    pu(); qtr(); fd(); qtl(); pd()
    fdn(n); pu(); qtl(); fd(); qtr(); nailHead()
    pu(); fdn(-n); pd()

# Chevron
def ten():
    pu(); fd(); qtr(); pd()
    gsX(x * 2); cr(); tetr(); gsX(x)
    gsY(x * 2); cr(); tetr(); gsY(x)
    gsX(x * 2); cr()
    pu(); tetl(); fd(); tetl(); pd(); gs(x)

# Leave n blanks horizontally, starting from and
# coming back to a north orientation of the robot
def spacing(n):
    pu(); qtr(); fdn(n); qtl(); pd()

def tensOfSexagesimalUnits(tensDigit):
    if tensDigit == 1:
        ten()
    elif tensDigit == 2:
        ten(); ten()
    elif tensDigit == 3:
        ten(); ten(); ten()
    elif tensDigit == 4:
        pu(); qtr(); fdn(2); qtl(); pd()
        ten()
        pu(); fdn(2); qtl(); fdn(4); qtr(); pd()
        ten(); ten(); ten()
        pu(); fdn(-2); pd()
    elif tensDigit == 5:
        pu(); qtr(); fd(); qtl(); pd()
        ten(); ten()
        pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
        ten(); ten(); ten()
        pu(); fdn(-2); pd()
    else:
        pass

def unitsOfSexagesimalUnits(unitsDigit):
    if unitsDigit == 1:
        one(4)
    elif unitsDigit == 2:
        one(4); one(4)
    elif unitsDigit == 3:
        one(4); one(4); one(4)
    elif unitsDigit == 4:
        pu(); qtr(); fd(); qtl(); pd()
        gs(x * 2); nailHead(); gs(x)
        pu(); fdn(4); qtl(); fdn(5); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    elif unitsDigit == 5:
        pu(); qtr(); fd(); qtl(); pd()
        one(2); one(2)
        pu(); fdn(4); qtl(); fdn(5); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    elif unitsDigit == 6:
        one(2); one(2); one(2)
        pu(); fdn(4); qtl(); fdn(6); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    elif unitsDigit == 7:
        pu(); qtr(); fd(); qtl(); pd()
        gsX(x * 2); nailHead()
        pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    elif unitsDigit == 8:
        pu(); qtr(); fd(); qtl(); pd()
        nailHead(); nailHead()
        pu(); fdn(2); qtl(); fdn(5); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    elif unitsDigit == 9:
        nailHead(); nailHead(); nailHead()
        pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(2); qtl(); fdn(6); qtr(); pd()
        nailHead(); nailHead(); nailHead()
        pu(); fdn(-4); pd()
    else:
        pass

# In a middle position and only to mark
# the absence of units in this position
def babylonianZero():
    pu(); qtr(); fdn(6); pd()
    tetl(); fdn(3); gs(x * 2); cr(); fdn(-1); cr()
    pu(); ht(); gs(x); fd(); pd(); gs(x * 2); cr()
    fdn(-1)
    cr(); pu(); gs(x * 4); fd(); tetl(); pd(); gs(x)

def unitsInBabylonian(sexagesimalUnits):
    if sexagesimalUnits == 0:
        babylonianZero()
    else:
        tensOfSexagesimalUnits(sexagesimalUnits // 10)
        spacing(1)
        unitsOfSexagesimalUnits(sexagesimalUnits % 10)
    spacing(4)

def numberInBabylonian(c):
    if c < 60:
        unitsInBabylonian(c)
    else:
        numberInBabylonian(c // 60)
        unitsInBabylonian(c % 60)

write("Number to code n = ")
n = readInt()
gs(x); gl()
numberInBabylonian(n)
st()
