from LibRobot import *

# Write a number in Greek acrophonic numeration
x = 2  # Grid size
w = 1  # Pen width
talent = 6000
drachma = 6
obol = 1

def spacing():
    pu(); qtr(); fdn(2); qtl(); pd()

def one():
    pw(w * 2); fdn(9); fdn(-9); pw(w)

def oneDrachma():
    pw(w * 2); fdn(9); fdn(-4); qtr(); fdn(2); pu()
    qtl()
    fdn(-5); pd(); pw(w)

def oneTalent():
    pw(w * 2); pu(); qtr(); fdn(3); qtl(); pd()
    fdn(9); qtl()
    fdn(3); fdn(-6); fdn(3); qtr(); fdn(-9); pu()
    qtr()
    fdn(3); qtl(); pd(); pw(w)

def five():
    pw(w * 2)
    fdn(9); qtr(); fdn(6); qtr(); fdn(4)
    pu(); fdn(5); ht(); pd()
    pw(w)

def fiveTalents():
    pw(w * 2)
    fdn(9); qtr(); fdn(6); qtr(); fdn(3); qtr(); fdn(3)
    qtl(); fdn(2); fdn(-2); qtr(); fdn(3); pu()
    fdn(-6)
    qtr(); fdn(-6); pd(); pw(w)

def ten(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    gsY(valGsY() * 3); etr(); fd(); qtr(); fd()
    tetr(); fdn(2)
    pu(); ht(); fdn(2); qtl(); pd(); gs(x); pw(w)

def tenTalents(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    pu(); gsY(valGsY() / 3 * 2); fd(); pd()
    gsY(valGsY() * 7 / 2); etr()
    fd()
    qtr(); fd(); tetr(); fd(); qtl()
    gsY(valGsY() * 2 / 7); fd(); fdn(-1)
    qtr(); fd(); pu(); fdn(-2); qtr(); fdn(-1)
    pd(); gs(x); pw(w)

def fifty():
    pu(); gs(x / 2); fdn(11); gs(x); qtr(); fdn(2)
    qtl()
    pd()
    ten(False)
    pu(); qtl(); fdn(4); qtl(); gs(x / 2); fdn(11)
    gs(x)
    ht(); pd()
    five()

def fiftyTalents():
    pu(); gs(x / 2); fdn(11); gs(x); qtr(); fdn(2)
    qtl()
    pd()
    tenTalents(False)
    pu(); qtl(); fdn(4); qtl(); gs(x / 2); fdn(11)
    gs(x)
    ht(); pd()
    five()

def hundred(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    fdn(3); gsY(valGsY() / 2); fdn(-3); qtr(); fdn(2)
    qtl()
    fdn(3); fdn(-6); gs(x); pw(w)

def hundredTalents(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    fdn(3); gsY(valGsY() / 2); fdn(-3); qtr(); fd()
    qtr()
    gsY(valGsY() * 4 / 3); fd(); fdn(-1); qtl()
    fd(); qtl()
    gsY(valGsY() * 3 / 4); fdn(3); fdn(-6); gs(x); pw(w)

def fiveHundred():
    pu(); fdn(5); qtr(); fdn(4); qtl(); pd()
    hundred(False)
    pu(); qtl(); fdn(6); qtl(); fdn(5); ht(); pd()
    five()

def fiveHundredTalents():
    pu(); fdn(5); qtr(); fdn(4); qtl(); pd()
    hundredTalents(False)
    pu(); qtl(); fdn(6); qtl(); fdn(5); ht(); pd()
    five()

def thousand(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    gsX(valGsX() * 2); gsY(valGsY() * 3); etr()
    fd()
    pu(); tetl(); fd(); tetl(); pd(); fd()
    tetl(); gs(x); pw(w)

def thousandTalents(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    gsY(valGsY() / 3 * 2); pu(); qtr(); fd()
    qtl(); pd(); fd(); qtr()
    fd(); fdn(-2); etl(); gsX(valGsX() * 2)
    gsY(valGsY() * 7 / 2)
    fd(); pu(); tetl(); fd(); tetl(); pd(); fd()
    tetl()
    gsY(valGsY() * 2 / 7)
    pu(); fdn(-1); pd(); gs(x); pw(w)

def fiveThousand():
    pu(); gs(x / 2); fdn(11); gs(x); qtr(); fdn(2)
    qtl()
    pd()
    thousand(False)
    pu(); qtl(); fdn(4); qtl(); gs(x / 2); fdn(11)
    gs(x)
    ht(); pd()
    five()

def fiveThousandTalents():
    pu(); gs(x / 2); fdn(11); gs(x); qtr(); fdn(2)
    qtl()
    pd()
    thousandTalents(False)
    pu(); qtl(); fdn(4); qtl(); gs(x / 2); fdn(11)
    gs(x)
    ht(); pd()
    five()

def tenThousand(bigSize):
    if bigSize:
        gs(x * 3); pw(w * 2)
    fdn(3); gsY(valGsY() * 2); tetr(); fd(); qtl()
    fd()
    gsY(valGsY() / 2); tetr(); fdn(3); ht()
    gs(x); pw(w)

def fiftyThousand():
    pu(); gs(x / 2); fdn(11); gs(x); qtr(); fdn(2)
    qtl()
    pd()
    tenThousand(False)
    pu(); qtl(); fdn(4); qtl(); gs(x / 2); fdn(11)
    gs(x)
    ht(); pd()
    five()

def writeDigit(bigNumber, unit, powerOfTen, digit):
    if unit == talent:
        for i in range(digit // 5):
            if powerOfTen == 0:
                fiveTalents()
            elif powerOfTen == 1:
                fiftyTalents()
            elif powerOfTen == 2:
                fiveHundredTalents()
            elif powerOfTen == 3:
                fiveThousandTalents()
            else:
                pass
            spacing()
        for i in range(digit % 5):
            if powerOfTen == 0:
                oneTalent()
            elif powerOfTen == 1:
                tenTalents(True)
            elif powerOfTen == 2:
                hundredTalents(True)
            elif powerOfTen == 3:
                thousandTalents(True)
            else:
                pass
            spacing()
    elif unit == drachma:
        for i in range(digit // 5):
            if powerOfTen == 0:
                five()
            elif powerOfTen == 1:
                fifty()
            elif powerOfTen == 2:
                fiveHundred()
            elif powerOfTen == 3:
                fiveThousand()
            elif powerOfTen == 4:
                fiftyThousand()
            else:
                pass
            spacing()
        for i in range(digit % 5):
            if powerOfTen == 0:
                if bigNumber:
                    oneDrachma()
                else:
                    one()
            elif powerOfTen == 1:
                ten(True)
            elif powerOfTen == 2:
                hundred(True)
            elif powerOfTen == 3:
                thousand(True)
            elif powerOfTen == 4:
                tenThousand(True)
            else:
                pass
            spacing()
    elif unit == obol:
        for i in range(digit):
            one()
            spacing()

def writeNumber(b, u, p, c):
    if c < 10:
        writeDigit(b, u, p, c)
    else:
        writeNumber(b, u, p + 1, c // 10)
        writeDigit(b, u, p, c % 10)

def writeNumberInGreek(c):
    bigNumber = True
    if c >= 100000:
        writeNumber(bigNumber, talent, 0, c // 6 // 6000)
        writeNumber(bigNumber, drachma, 0, c // 6 % 6000)
        writeNumber(bigNumber, obol, 0, c % 6)
    else:
        writeNumber(not bigNumber, drachma, 0, c)

write("Number to code n = ")
n = readInt()
pw(w); gs(x); gl()
writeNumberInGreek(n)
st()
