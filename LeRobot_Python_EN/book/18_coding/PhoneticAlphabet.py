from LibRobot import *

# Write the international phonetic alphabet
gridSize = 3
lineSpacing = 3
wordSpacing = 2

# Go to the next line if there is no more room on the
# current line to write a word of n letters of the
# alphabet, each in a (2 x 4) rectangle, spaced by 1.
def newLine(n):
    fe()
    # Try to skip 3 spaces per letter plus one at the end
    # of the word of n letters.
    for i in range(3 * n + 1):
        if not tb():
            translate(1, 0)
    if tb():
        # Go to the next line, no room on the current
        # line.
        gl(); translate(0, -(4 + lineSpacing))
    # Go back to write on the current line
    else:
        translate(-(3 * n + 1), 0)

# Write the letters of the alphabet in a (2 x 4)
# rectangle
def writeA():
    fn(); fdn(2); qtr(); fdn(2); fdn(-2); qtl(); fd()
    cr(); cr(); fdn(3)
    translate(1, 0)

def writeB():
    fn(); fdn(4); qtr(); fd(); cr(); cr(); fd()
    ht(); fd(); cr(); cr(); fd()
    translate(3, 0)

def writeC():
    translate(2, 1); fs(); cr(); cr(); fdn(2); cr()
    cr(); translate(1, -3)

def writeD():
    fn(); fdn(4); qtr(); fd(); cr(); fdn(2); cr()
    fd(); translate(3, 0)

def writeE():
    fe(); fdn(2); fdn(-2); qtl(); fdn(2); qtr(); fd()
    ht(); fd()
    qtr(); fdn(2); qtr(); fd(); fd()
    translate(1, -4)

def writeF():
    fn(); fdn(2); qtr(); fd(); ht(); fd(); qtr()
    fdn(2); qtr(); fdn(2)
    translate(1, -4)

def writeG():
    translate(1, 2); fe(); fd(); qtr(); fd(); cr()
    cr(); fdn(2); cr(); cr()
    translate(1, -3)

def writeH():
    fn(); fdn(2); qtr(); fdn(2); fdn(-2); qtl(); fdn(2)
    translate(2, -4)
    fdn(4); translate(1, -4)

def writeI():
    fe(); fdn(2); ht(); fd(); qtr(); fdn(4); qtl()
    fd(); ht(); fdn(2)
    translate(1, -4)

def writeJ():
    translate(0, 4); fe(); fdn(2); qtr(); fdn(3); cr()
    cr()
    translate(3, -1)

def writeK():
    fn(); fdn(4); translate(0, -2); fe(); cl(); cr()
    translate(-2, -2)
    cr(); cl(); translate(1, 0)

def writeL():
    fn(); fdn(4); translate(0, -4); fe(); fdn(2)
    translate(1, 0)

def writeM():
    fn(); fdn(4); ht(); cl(); cl(); ht(); fdn(4)
    translate(1, 0)

def writeN():
    fn(); fdn(4); qtr(); cr(); cl(); qtl(); fdn(2)
    ht(); fdn(4)
    translate(1, 0)

def writeO():
    translate(1, 0); fw(); cr(); fdn(2); cr(); cr()
    fdn(2); cr()
    translate(2, 0)

def writeP():
    fn(); fdn(4); qtr(); fd(); cr(); cr(); fd()
    translate(3, -2); ht()

def writeQ():
    translate(1, 1); fs(); cl(); translate(-1, 0)
    fw(); cr(); fdn(2)
    cr(); cr(); fdn(2); cr(); translate(2, 0)

def writeR():
    fn(); fdn(4); qtr(); fd(); cr(); cr(); fd()
    ht(); fd(); cr(); fd()
    translate(1, 0)

def writeS():
    translate(0, 1); fs(); cl(); cl(); cl(); cr()
    cr(); cr(); translate(1, -3)

def writeT():
    translate(1, 0); fn(); fdn(4); translate(-1, 0)
    fe(); fdn(2)
    translate(1, -4)

def writeU():
    translate(0, 4); fs(); fdn(3); cl(); cl(); fdn(3)
    translate(1, -4)

def writeV():
    translate(0, 4); fs(); fdn(3); qtl(); cr(); ht()
    cr(); qtl(); fdn(3)
    translate(1, -4)

def writeW():
    translate(0, 4); fs(); fdn(4); qtl(); cl(); fdn(2)
    ht(); fdn(2); cl()
    qtl(); fdn(4); translate(1, -4)

def writeX():
    fn(); fd(); cr(); cl(); fd(); translate(-2, 0)
    fs(); fd(); cl(); cr(); fd()
    translate(1, 0)

def writeY():
    translate(0, 4); fs(); fd(); cl(); cl(); fd()
    ht(); fdn(3); cr(); cr()
    translate(3, -1)

def writeZ():
    translate(0, 4); fe(); fdn(2); qtr(); fd(); cr()
    cl(); fd(); qtl(); fdn(2)
    translate(1, 0)

# An extra space between words
def space():
    translate(wordSpacing, 0)

# International code of the alphabet by phonetic reading
# ALFA
def a():
    newLine(4); writeA(); writeL(); writeF()
    writeA(); space()

# BRAVO
def b():
    newLine(5); writeB(); writeR(); writeA()
    writeV(); writeO(); space()

# CHARLIE
def c():
    newLine(7); writeC(); writeH(); writeA()
    writeR(); writeL(); writeI()
    writeE(); space()

# DELTA
def d():
    newLine(5); writeD(); writeE(); writeL()
    writeT(); writeA(); space()

# ECHO
def e():
    newLine(4); writeE(); writeC(); writeH()
    writeO(); space()

# FOXTROT
def f():
    newLine(7); writeF(); writeO(); writeX()
    writeT(); writeR(); writeO()
    writeT(); space()

# GOLF
def g():
    newLine(4); writeG(); writeO(); writeL()
    writeF(); space()

# HOTEL
def h():
    newLine(5); writeH(); writeO(); writeT()
    writeE(); writeL(); space()

# INDIA
def i():
    newLine(5); writeI(); writeN(); writeD()
    writeI(); writeA(); space()

# JULIET
def j():
    newLine(6); writeJ(); writeU(); writeL()
    writeI(); writeE(); writeT()
    space()

# KILO
def k():
    newLine(4); writeK(); writeI(); writeL()
    writeO(); space()

# LIMA
def l():
    newLine(4); writeL(); writeI(); writeM()
    writeA(); space()

# MIKE
def m():
    newLine(4); writeM(); writeI(); writeK()
    writeE(); space()

# NOVEMBER
def n():
    newLine(8); writeN(); writeO(); writeV()
    writeE(); writeM()
    writeB(); writeE(); writeR(); space()

# OSCAR
def o():
    newLine(5); writeO(); writeS(); writeC()
    writeA(); writeR(); space()

# PAPA
def p():
    newLine(4); writeP(); writeA(); writeP()
    writeA(); space()

# QUEBEC
def q():
    newLine(6); writeQ(); writeU(); writeE()
    writeB(); writeE(); writeC()
    space()

# ROMEO
def r():
    newLine(5); writeR(); writeO(); writeM()
    writeE(); writeO(); space()

# SIERRA
def s():
    newLine(6); writeS(); writeI(); writeE()
    writeR(); writeR(); writeA()
    space()

# TANGO
def t():
    newLine(5); writeT(); writeA(); writeN()
    writeG(); writeO(); space()

# UNIFORM
def u():
    newLine(7); writeU(); writeN(); writeI()
    writeF(); writeO(); writeR()
    writeM(); space()

# VICTOR
def v():
    newLine(6); writeV(); writeI(); writeC()
    writeT(); writeO(); writeR()
    space()

# WHISKEY
def w():
    newLine(7); writeW(); writeH(); writeI()
    writeS(); writeK(); writeE()
    writeY(); space()

# XRAY
def x():
    newLine(4); writeX(); writeR(); writeA()
    writeY(); space()

# YANKEE
def y():
    newLine(6); writeY(); writeA(); writeN()
    writeK(); writeE(); writeE()
    space()

# ZULU
def z():
    newLine(4); writeZ(); writeU(); writeL()
    writeU(); space()

gs(gridSize); gt(); gl()
translate(0, -(4 + lineSpacing))
a(); b(); c(); d(); e(); f(); g(); h(); i()
j(); k(); l(); m(); n(); o()
p(); q(); r(); s(); t(); u(); v()
w(); x(); y(); z(); st()
