from LibRobot import *

# Write a number in Roman numerals
x = 3  # Grid size

def spacing(n):
    pu(); qtr(); fdn(n); qtl(); pd()

def one():
    fdn(6); fdn(-6)
    spacing(2)

def five():
    pu(); fdn(6); pd(); tetr(); gsX(x * 2)
    gsY(x * 6)
    fd()
    qtl(); fd(); pu(); tetr(); fd(); ht(); pd()
    gs(x)
    spacing(2)

def ten():
    gsX(x * 4); gsY(x * 6); etr(); fd(); pu()
    tetl()
    fd(); pd()
    tetl(); fd(); pu(); tetl(); pd(); gs(x)
    spacing(2)

def fifty():
    fdn(6); fdn(-6); qtr(); fdn(4)
    qtl()
    spacing(2)

def hundred():
    pu(); gsX(x * 4); gsY(x * 2); etr(); fd()
    pd()
    gsX(x * 2)
    tetr(); cr(); gsY(x * 3); cr(); cr()
    gsY(x * 2)
    cr(); pu()
    fdn(2); ht(); pd(); gs(x)
    spacing(2)

def fiveHundred():
    fdn(6); qtr(); fdn(1); gs(x * 3); cr(); cr(); gs(x)
    fd()
    pu(); fdn(-4); qtr(); pd()
    spacing(2)

def thousand():
    fdn(6); gsX(x * 2); gsY(x * 5); tetr(); fd()
    qtl()
    fd()
    gs(x); tetr(); fdn(6); ht()
    spacing(2)

def overline(n):
    pu(); fdn(8); qtl(); fdn(2); pd(); fdn(n - 2)
    fdn(2 - n)
    pu(); fdn(-2); qtr(); fdn(-8); pd()

def startFactorHundredThousand():
    fdn(8); qtr(); fdn(2); fdn(-2); qtl(); fdn(-8)
    spacing(2)

def endFactorHundredThousand():
    fdn(8); qtl(); fdn(2); fdn(-2); qtr(); fdn(-8)
    spacing(4)

def writeNumberInRoman(n):
    if n >= 1000:
        thousand(); writeNumberInRoman(n - 1000)
    elif n >= 950:
        fifty(); thousand(); writeNumberInRoman(n - 950)
    elif n >= 900:
        hundred(); thousand(); writeNumberInRoman(n - 900)
    elif n >= 500:
        fiveHundred(); writeNumberInRoman(n - 500)
    elif n >= 400:
        hundred(); fiveHundred(); writeNumberInRoman(n - 400)
    elif n >= 100:
        hundred(); writeNumberInRoman(n - 100)
    elif n >= 90:
        ten(); hundred(); writeNumberInRoman(n - 90)
    elif n >= 50:
        fifty(); writeNumberInRoman(n - 50)
    elif n >= 40:
        ten(); fifty(); writeNumberInRoman(n - 40)
    elif n >= 10:
        ten(); writeNumberInRoman(n - 10)
    elif n >= 9:
        one(); ten()
    elif n >= 5:
        five(); writeNumberInRoman(n - 5)
    elif n >= 4:
        one(); five()
    elif n >= 1:
        one(); writeNumberInRoman(n - 1)

# Width of the number n written in Roman numerals
def width(n):
    if n >= 1000:
        return 6 + width(n - 1000)
    elif n >= 950:
        return 2 * 6 + width(n - 950)
    elif n >= 900:
        return 2 * 6 + width(n - 900)
    elif n >= 500:
        return 6 + width(n - 500)
    elif n >= 400:
        return 2 * 6 + width(n - 400)
    elif n >= 100:
        return 6 + width(n - 100)
    elif n >= 90:
        return 2 * 6 + width(n - 90)
    elif n >= 50:
        return 6 + width(n - 50)
    elif n >= 40:
        return 2 * 6 + width(n - 40)
    elif n >= 10:
        return 6 + width(n - 10)
    elif n >= 9:
        return 2 + 6
    elif n >= 5:
        return 6 + width(n - 5)
    elif n >= 4:
        return 2 + 6
    elif n >= 1:
        return 2 + width(n - 1)
    else:
        return 0

def numberInRoman(n):
    if n >= 500000000:
        writeln("Too big for Roman numerals.")
    elif n >= 100000:
        startFactorHundredThousand()
        writeNumberInRoman(n // 100000)
        overline(width(n // 100000))
        endFactorHundredThousand()
        numberInRoman(n % 100000)
    elif n < 5000:
        writeNumberInRoman(n)
    else:
        writeNumberInRoman(n // 1000)
        overline(width(n // 1000))
        spacing(2)
        writeNumberInRoman(n % 1000)

write("Number to code n = ")
n = readInt()
gs(x); gl(); spacing(2)
numberInRoman(n)
st()
