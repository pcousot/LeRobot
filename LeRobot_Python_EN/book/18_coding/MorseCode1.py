from LibRobot import *

# Write and sound out signs in Morse code

# Go to the start of the next line
def newLine():
    pu(); gl(); fs(); fd(); fe(); fd(); pd()

# Dot
def dot():
    dp(); beep(); pu(); fd(); pd(); delay(0.1)

# Blank
def blank():
    pu(); fd(); pd(); delay(0.1)

# Dash
def dash():
    fd(); longBeep(); pu(); fd(); pd(); delay(0.1)

# Alphabet
def a():
    dot(); dash(); blank()

def b():
    dash(); dot(); dot(); dot(); blank()

def c():
    dash(); dot(); dash(); dot(); blank()

def d():
    dash(); dot(); dot(); blank()

def e():
    dot(); blank()

def f():
    dot(); dot(); dash(); dot(); blank()

def g():
    dash(); dash(); dot(); blank()

def h():
    dot(); dot(); dot(); dot(); blank()

def i():
    dot(); dot(); blank()

def j():
    dot(); dash(); dash(); dash(); blank()

def k():
    dash(); dot(); dash(); blank()

def l():
    dot(); dash(); dot(); dot(); blank()

def m():
    dash(); dash(); blank()

def n():
    dash(); dot(); blank()

def o():
    dash(); dash(); dash(); blank()

def p():
    dot(); dash(); dash(); dot(); blank()

def q():
    dash(); dash(); dot(); dash(); blank()

def r():
    dot(); dash(); dot(); blank()

def s():
    dot(); dot(); dot(); blank()

def t():
    dash(); blank()

def u():
    dot(); dot(); dash(); blank()

def v():
    dot(); dot(); dot(); dash(); blank()

def w():
    dot(); dash(); dash(); blank()

def x():
    dash(); dot(); dot(); dash(); blank()

def y():
    dash(); dot(); dash(); dash(); blank()

def z():
    dash(); dash(); dot(); dot(); blank()

# Digits
def c1():
    dot(); dash(); dash(); dash(); dash(); blank()

def c2():
    dot(); dot(); dash(); dash(); dash(); blank()

def c3():
    dot(); dot(); dot(); dash(); dash(); blank()

def c4():
    dot(); dot(); dot(); dot(); dash(); blank()

def c5():
    dot(); dot(); dot(); dot(); dot(); blank()

def c6():
    dash(); dot(); dot(); dot(); dot(); blank()

def c7():
    dash(); dash(); dot(); dot(); dot(); blank()

def c8():
    dash(); dash(); dash(); dot(); dot(); blank()

def c9():
    dash(); dash(); dash(); dash(); dot(); blank()

def c0():
    dash(); dash(); dash(); dash(); dash(); blank()

# Punctuation
def fullStop():
    dot(); dot(); dot(); dot(); dot(); dot(); blank()

def comma():
    dot(); dash(); dot(); dash(); dot(); dash(); blank()

def semicolon():
    dash(); dash(); dash(); dot(); dot(); dot(); blank()

def colon():
    dash(); dot(); dash(); dot(); dash(); dot(); blank()

def questionMark():
    dot(); dot(); dash(); dash(); dot(); dot(); blank()

def exclamationMark():
    dash(); dash(); dot(); dot(); dash(); dash(); blank()

def hyphen():
    dash(); dot(); dot(); dot(); dot(); dash(); blank()

def apostrophe():
    dash(); dash(); dash(); dash(); blank()

def slash():
    dash(); dash(); dash(); dash(); dash(); dash(); blank()

# End of word
def endOfWord():
    pu(); fd(); pd(); delay(0.6)

def error():
    for i in range(11):
        dot()
    blank()

def startOfTransmission():
    pw(2); gt(); newLine()
    dash(); dot(); dash(); dot(); dash(); dot(); dash(); blank()

def endOfTransmission():
    dot(); dash(); dot(); dash(); dot(); dash(); dot(); blank()

startOfTransmission()
a(); b(); c(); d(); e(); newLine()
f(); g(); h(); i(); j(); k(); l(); newLine()
m(); n(); o(); p(); q(); r(); s(); newLine()
t(); u(); v(); w(); x(); y(); newLine()
z(); c1(); c2(); c3(); newLine()
c4(); c5(); c6(); c7(); c8(); newLine()
c9(); c0(); fullStop(); comma(); newLine()
semicolon(); colon(); questionMark()
exclamationMark(); newLine()
hyphen(); apostrophe(); slash()
newLine(); error(); endOfTransmission(); st()
