from LibRobot import *

# Send a message with Chappe's telegraph
signalDuration = 2  # seconds to see a signal
armLength = 60  # Length of an articulated arm
# Grid size for a diagonal arm
diagonal = 42

# Position of the end arms
armN = 1
armNE = 2
armE = 3
armSE = 4
armS = 5
armSW = 6
armW = 7
armNW = 8

# Position of the central arm
southNorth = 1
southWestNorthEast = 2
westEast = 3
northWestSouthEast = 4

def erase():
    delay(signalDuration); bg(white); gs(60); pw(6)

def chappeArm(arm):
    if arm == armN:
        fn(); gs(armLength)
    elif arm == armNE:
        fne(); gs(diagonal)
    elif arm == armE:
        fe(); gs(armLength)
    elif arm == armSE:
        fse(); gs(diagonal)
    elif arm == armS:
        fs(); gs(armLength)
    elif arm == armSW:
        fsw(); gs(diagonal)
    elif arm == armW:
        fw(); gs(armLength)
    elif arm == armNW:
        fnw(); gs(diagonal)
    fd()

def chappe(l, m, r):
    if m == southNorth:
        gc(); fs(); gs(armLength); fd()
        chappeArm(l)
        gc(); fn(); gs(armLength); fd()
        chappeArm(r)
    elif m == southWestNorthEast:
        gc(); fsw(); gs(diagonal); fd()
        chappeArm(l)
        gc(); fne(); gs(diagonal); fd()
        chappeArm(r)
    elif m == westEast:
        gc(); fw(); gs(armLength); fd()
        chappeArm(l)
        gc(); fe(); gs(armLength); fd()
        chappeArm(r)
    elif m == northWestSouthEast:
        gc()
        fnw(); gs(diagonal); fd()
        chappeArm(l)
        gc(); fse(); gs(diagonal); fd()
        chappeArm(r)
    gc(); fn()
    erase()

# Letters: capA() for capital A, a() for small a,
# etc.
def capA():
    chappe(armN, westEast, armNE)

def a():
    chappe(armNW, westEast, armN)

def capB():
    chappe(armSW, southWestNorthEast, armNW)

def b():
    chappe(armNE, northWestSouthEast, armSE)

def capC():
    chappe(armS, westEast, armS)

def c():
    chappe(armN, westEast, armN)

def capD():
    chappe(armN, southWestNorthEast, armNE)

def d():
    chappe(armNW, northWestSouthEast, armN)

def capE():
    chappe(armE, southNorth, armE)

def e():
    chappe(armW, southNorth, armW)

def capF():
    chappe(armN, westEast, armNE)

def f():
    chappe(armN, westEast, armNW)

def capG():
    chappe(armN, northWestSouthEast, armN)

def g():
    chappe(armN, southWestNorthEast, armN)

def capH():
    chappe(armW, southNorth, armE)

def h():
    chappe(armE, southNorth, armW)

def capI():
    chappe(armS, southNorth, armSE)

def i():
    chappe(armS, southNorth, armSW)

def capJ():
    chappe(armSW, westEast, armSE)

def j():
    chappe(armNW, westEast, armNE)

def capK():
    chappe(armS, southNorth, armE)

def k():
    chappe(armS, southNorth, armW)

def capL():
    chappe(armE, southNorth, armN)

def l():
    chappe(armW, southNorth, armN)

def capM():
    chappe(armN, southWestNorthEast, armSE)

def m():
    chappe(armSW, northWestSouthEast, armN)

def capN():
    chappe(armS, northWestSouthEast, armNE)

def n():
    chappe(armNW, southWestNorthEast, armS)

def capO():
    chappe(armN, northWestSouthEast, armE)

def o():
    chappe(armW, southWestNorthEast, armN)

def capP():
    chappe(armNW, northWestSouthEast, armSW)

def p():
    chappe(armSE, southWestNorthEast, armNE)

def capQ():
    chappe(armE, southNorth, armNW)

def q():
    chappe(armW, southNorth, armNE)

def capR():
    chappe(armS, southNorth, armE)

def r():
    chappe(armS, southNorth, armW)

def capS():
    chappe(armNE, northWestSouthEast, armSW)

def s():
    chappe(armSE, southWestNorthEast, armNW)

def capT():
    chappe(armSW, southWestNorthEast, armS)

def t():
    chappe(armS, northWestSouthEast, armSE)

def capU():
    chappe(armS, northWestSouthEast, armW)

def u():
    chappe(armE, southWestNorthEast, armS)

def capV():
    chappe(armS, westEast, armSW)

def v():
    chappe(armSE, westEast, armS)

def capW():
    chappe(armSW, northWestSouthEast, armSW)

def w():
    chappe(armSE, southWestNorthEast, armSE)

def capX():
    chappe(armNW, southWestNorthEast, armW)

def x():
    chappe(armE, northWestSouthEast, armNE)

def capY():
    chappe(armS, southWestNorthEast, armS)

def y():
    chappe(armS, northWestSouthEast, armS)

def capZ():
    chappe(armNW, southWestNorthEast, armNW)

def z():
    chappe(armNE, northWestSouthEast, armNE)

# Digits
def c0():
    chappe(armSE, westEast, armN)

def c1():
    chappe(armW, westEast, armE)

def c2():
    chappe(armS, southNorth, armN)

def c3():
    chappe(armS, southNorth, armNE)

def c4():
    chappe(armNE, westEast, armNW)

def c5():
    chappe(armNE, westEast, armS)

def c6():
    chappe(armS, northWestSouthEast, armSW)

def c7():
    chappe(armSE, southWestNorthEast, armS)

def c8():
    chappe(armSE, westEast, armSW)

def c9():
    chappe(armN, southWestNorthEast, armNW)

# Punctuation .
def fullStop():
    chappe(armS, southNorth, armW)

# ,
def comma():
    chappe(armNW, westEast, armE)

# ;
def semicolon():
    chappe(armW, westEast, armNE)

# :
def colon():
    chappe(armS, southNorth, armE)

# ?
def questionMark():
    chappe(armSW, westEast, armNE)

# !
def exclamationMark():
    chappe(armNW, westEast, armSE)

# (
def leftParenthesis():
    chappe(armW, southNorth, armN)

# )
def rightParenthesis():
    chappe(armE, southNorth, armN)

# Blank
def blank():
    chappe(armN, northWestSouthEast, armN)

erase()
capP(); a(); r(); i(); s(); e(); s(); t(); t()
r(); a(); n(); q(); u(); i()
l(); l(); e(); e(); t(); l(); e(); s(); b()
o(); n(); s()
c(); i(); t(); o(); y(); e(); n(); s(); s()
o(); n(); t(); c(); o(); n()
t(); e(); n(); t(); s(); fullStop()
