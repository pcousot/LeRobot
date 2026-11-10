from LibRobot import *

# Write signs in Morse code with their translation,
# and sound them out

# Go to the start of the next line.
def newLine():
    pu(); gl(); fs(); fd(); fe(); fd(); pd()

# Test whether it is possible to move forward n times
# without touching the border.
def testForward(n):
    # Try to move forward (n - 1) times without touching
    # the border
    pu()
    for i in range(n - 1):
        if not tb():
            fd()
    if tb():
        # Yes, the n-th fd() leaves the frame:
        # go to the start of the next line.
        newLine(); newLine()
    # No, go back to the starting point in the current
    # line.
    else:
        fdn(-(n - 1))
    pd()

# Dot
def dot():
    testForward(1); dp(); beep(); pu(); fd(); pd()
    delay(0.2)

# Blank
def blank():
    testForward(1); pu(); fd(); pd(); delay(0.2)

# Dash
def dash():
    testForward(2); fd(); longBeep(); pu(); fd(); pd()
    delay(0.2)

# Write the text l (followed by a blank if its length
# is odd) and move forward past it
def wrt(l):
    l = l + " " if len(l) % 2 == 1 else l
    testForward(len(l) // 2); label(l)
    pu(); fdn(len(l) // 2); pd()

# Test that a symbol of p dots, t dashes, b blanks and
# c characters fits on the current line, otherwise go
# to the next line.
def testEndOfLine(p, t, b, c):
    if c % 2 == 1:
        testForward(p + 2 * t + b + (c + 1) // 2)
    else:
        testForward(p + 2 * t + b + c // 2)

# Alphabet
def a():
    testEndOfLine(1, 1, 1, 3); wrt("A :"); dot(); dash(); blank()

def b():
    testEndOfLine(3, 1, 1, 3); wrt("B :"); dash(); dot(); dot()
    dot(); blank()

def c():
    testEndOfLine(2, 2, 1, 3); wrt("C :"); dash(); dot(); dash()
    dot(); blank()

def d():
    testEndOfLine(1, 2, 1, 3); wrt("D :"); dash(); dot(); dot()
    blank()

def e():
    testEndOfLine(1, 0, 1, 3); wrt("E :"); dot(); blank()

def f():
    testEndOfLine(3, 1, 1, 3); wrt("F :"); dot(); dot(); dash()
    dot(); blank()

def g():
    testEndOfLine(1, 2, 1, 3); wrt("G :"); dash(); dash(); dot()
    blank()

def h():
    testEndOfLine(4, 0, 1, 3); wrt("H :"); dot(); dot(); dot()
    dot(); blank()

def i():
    testEndOfLine(2, 0, 1, 3); wrt("I :"); dot(); dot(); blank()

def j():
    testEndOfLine(1, 3, 1, 3); wrt("J :"); dot(); dash(); dash()
    dash(); blank()

def k():
    testEndOfLine(1, 2, 1, 3); wrt("K :"); dash(); dot(); dash()
    blank()

def l():
    testEndOfLine(3, 1, 1, 3); wrt("L :"); dot(); dash(); dot()
    dot(); blank()

def m():
    testEndOfLine(1, 2, 1, 3); wrt("M :"); dash(); dash(); blank()

def n():
    testEndOfLine(0, 1, 1, 3); wrt("N :"); dash(); dot(); blank()

def o():
    testEndOfLine(1, 3, 1, 3); wrt("O :"); dash(); dash(); dash()
    blank()

def p():
    testEndOfLine(2, 2, 1, 3); wrt("P :"); dot(); dash(); dash()
    dot(); blank()

def q():
    testEndOfLine(1, 3, 1, 3); wrt("Q :"); dash(); dash(); dot()
    dash(); blank()

def r():
    testEndOfLine(2, 1, 1, 3); wrt("R :"); dot(); dash(); dot()
    blank()

def s():
    testEndOfLine(3, 0, 1, 3); wrt("S :"); dot(); dot(); dot()
    blank()

def t():
    testEndOfLine(0, 1, 1, 3); wrt("T :"); dash(); blank()

def u():
    testEndOfLine(2, 1, 1, 3); wrt("U :"); dot(); dot(); dash()
    blank()

def v():
    testEndOfLine(3, 1, 1, 3); wrt("V :"); dot(); dot(); dot()
    dash(); blank()

def w():
    testEndOfLine(1, 2, 1, 3); wrt("W :"); dot(); dash(); dash()
    blank()

def x():
    testEndOfLine(2, 2, 1, 3); wrt("X :"); dash(); dot(); dot()
    dash(); blank()

def y():
    testEndOfLine(1, 3, 1, 3); wrt("Y :"); dash(); dot(); dash()
    dash(); blank()

def z():
    testEndOfLine(2, 2, 1, 3); wrt("Z :"); dash(); dash(); dot()
    dot(); blank()

# Digits
def c1():
    testEndOfLine(1, 4, 1, 3); wrt("1 :"); dot(); dash(); dash()
    dash(); dash(); blank()

def c2():
    testEndOfLine(2, 3, 1, 3); wrt("2 :"); dot(); dot(); dash()
    dash(); dash(); blank()

def c3():
    testEndOfLine(3, 2, 1, 3); wrt("3 :"); dot(); dot(); dot()
    dash(); dash(); blank()

def c4():
    testEndOfLine(4, 1, 1, 3); wrt("4 :"); dot(); dot(); dot()
    dot(); dash(); blank()

def c5():
    testEndOfLine(5, 0, 1, 3); wrt("5 :"); dot(); dot(); dot()
    dot(); dot(); blank()

def c6():
    testEndOfLine(4, 1, 1, 3); wrt("6 :"); dash(); dot(); dot()
    dot(); dot(); blank()

def c7():
    testEndOfLine(3, 2, 1, 3); wrt("7 :"); dash(); dash(); dot()
    dot(); dot(); blank()

def c8():
    testEndOfLine(2, 3, 1, 3); wrt("8 :"); dash(); dash(); dash()
    dot(); dot(); blank()

def c9():
    testEndOfLine(1, 4, 1, 3); wrt("9 :"); dash(); dash(); dash()
    dash(); dot(); blank()

def c0():
    testEndOfLine(0, 5, 1, 3); wrt("0 :"); dash(); dash(); dash()
    dash(); dash(); blank()

# Full stop
def fullStop():
    testEndOfLine(6, 0, 1, 3); wrt(". :"); dot(); dot(); dot()
    dot(); dot(); dot(); blank()

# Comma
def comma():
    testEndOfLine(3, 3, 1, 3); wrt(", :"); dot(); dash(); dot()
    dash(); dot(); dash(); blank()

# Semicolon
def semicolon():
    testEndOfLine(3, 3, 1, 3); wrt("; :"); dash(); dash(); dash()
    dot(); dot(); dot(); blank()

# Colon
def colon():
    testEndOfLine(3, 3, 1, 3); wrt(": :"); dash(); dot(); dash()
    dot(); dash(); dot(); blank()

# Question mark
def questionMark():
    testEndOfLine(4, 2, 1, 3); wrt("? :"); dot(); dot(); dash()
    dash(); dot(); dot(); blank()

# Exclamation mark
def exclamationMark():
    testEndOfLine(2, 4, 1, 3); wrt("! :"); dash(); dash(); dot()
    dot(); dash(); dash(); blank()

# Hyphen
def hyphen():
    testEndOfLine(4, 5, 1, 3); wrt("- :"); dash(); dot(); dot()
    dot(); dot(); dash(); blank()

# Apostrophe
def apostrophe():
    testEndOfLine(0, 4, 1, 3); wrt("' :"); dash(); dash(); dash()
    dash(); blank()

# Slash
def slash():
    testEndOfLine(0, 6, 1, 3); wrt("/ :"); dash(); dash(); dash()
    dash(); dash(); dash(); blank()

# End of word
def endOfWord():
    testEndOfLine(0, 0, 1, 0); pu(); fd(); pd(); delay(0.6)

def error():
    testEndOfLine(11, 0, 1, 7); wrt("Error :"); dot(); dot()
    dot(); dot(); dot(); dot(); dot()
    dot(); dot(); dot(); dot(); blank()

def startOfTransmission():
    testEndOfLine(4, 3, 1, 23); wrt("Start of transmission :")
    dash(); dot(); dash(); dot(); dash()
    dot(); dash(); blank()

def endOfTransmission():
    testEndOfLine(4, 3, 1, 21); wrt("End of transmission :")
    dot(); dash(); dot(); dash(); dot()
    dash(); dot(); blank()

pw(2); gt(); gsY(9); newLine()
startOfTransmission()
a(); b(); c(); d(); e(); f(); g(); h(); i()
j(); k(); l(); m(); n(); o()
p(); q(); r(); s(); t(); u(); v(); w(); x()
y(); z()
c1(); c2(); c3(); c4(); c5(); c6(); c7(); c8()
c9(); c0()
fullStop(); comma(); semicolon(); colon()
questionMark(); exclamationMark()
hyphen(); apostrophe()
slash(); error()
endOfTransmission()
st()
