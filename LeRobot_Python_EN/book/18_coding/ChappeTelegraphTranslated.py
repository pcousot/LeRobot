from LibRobot import *

# Send a message with Chappe's telegraph, with its
# translation
signalDuration = 1.5  # seconds to see a signal
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
    message("A"); chappe(armN, westEast, armNE)

def a():
    message("a"); chappe(armNW, westEast, armN)

def capB():
    message("B"); chappe(armSW, southWestNorthEast, armNW)

def b():
    message("b"); chappe(armNE, northWestSouthEast, armSE)

def capC():
    message("C"); chappe(armS, westEast, armS)

def c():
    message("c"); chappe(armN, westEast, armN)

def capD():
    message("D"); chappe(armN, southWestNorthEast, armNE)

def d():
    message("d"); chappe(armNW, northWestSouthEast, armN)

def capE():
    message("E"); chappe(armE, southNorth, armE)

def e():
    message("e"); chappe(armW, southNorth, armW)

def capF():
    message("F"); chappe(armN, westEast, armNE)

def f():
    message("f"); chappe(armN, westEast, armNW)

def capG():
    message("G"); chappe(armN, northWestSouthEast, armN)

def g():
    message("g"); chappe(armN, southWestNorthEast, armN)

def capH():
    message("H"); chappe(armW, southNorth, armE)

def h():
    message("h"); chappe(armE, southNorth, armW)

def capI():
    message("I"); chappe(armS, southNorth, armSE)

def i():
    message("i"); chappe(armS, southNorth, armSW)

def capJ():
    message("J"); chappe(armSW, westEast, armSE)

def j():
    message("j"); chappe(armNW, westEast, armNE)

def capK():
    message("K"); chappe(armS, southNorth, armE)

def k():
    message("k"); chappe(armS, southNorth, armW)

def capL():
    message("L"); chappe(armE, southNorth, armN)

def l():
    message("l"); chappe(armW, southNorth, armN)

def capM():
    message("M"); chappe(armN, southWestNorthEast, armSE)

def m():
    message("m"); chappe(armSW, northWestSouthEast, armN)

def capN():
    message("N"); chappe(armS, northWestSouthEast, armNE)

def n():
    message("n"); chappe(armNW, southWestNorthEast, armS)

def capO():
    message("O"); chappe(armN, northWestSouthEast, armE)

def o():
    message("o"); chappe(armW, southWestNorthEast, armN)

def capP():
    message("P"); chappe(armNW, northWestSouthEast, armSW)

def p():
    message("p"); chappe(armSE, southWestNorthEast, armNE)

def capQ():
    message("Q"); chappe(armE, southNorth, armNW)

def q():
    message("q"); chappe(armW, southNorth, armNE)

def capR():
    message("R"); chappe(armS, southNorth, armE)

def r():
    message("r"); chappe(armS, southNorth, armW)

def capS():
    message("S"); chappe(armNE, northWestSouthEast, armSW)

def s():
    message("s"); chappe(armSE, southWestNorthEast, armNW)

def capT():
    message("T"); chappe(armSW, southWestNorthEast, armS)

def t():
    message("t"); chappe(armS, northWestSouthEast, armSE)

def capU():
    message("U"); chappe(armS, northWestSouthEast, armW)

def u():
    message("u"); chappe(armE, southWestNorthEast, armS)

def capV():
    message("V"); chappe(armS, westEast, armSW)

def v():
    message("v"); chappe(armSE, westEast, armS)

def capW():
    message("W"); chappe(armSW, northWestSouthEast, armSW)

def w():
    message("w"); chappe(armSE, southWestNorthEast, armSE)

def capX():
    message("X"); chappe(armNW, southWestNorthEast, armW)

def x():
    message("x"); chappe(armE, northWestSouthEast, armNE)

def capY():
    message("Y"); chappe(armS, southWestNorthEast, armS)

def y():
    message("y"); chappe(armS, northWestSouthEast, armS)

def capZ():
    message("Z"); chappe(armNW, southWestNorthEast, armNW)

def z():
    message("z"); chappe(armNE, northWestSouthEast, armNE)

# Digits
def c0():
    message("0"); chappe(armSE, westEast, armN)

def c1():
    message("1"); chappe(armW, westEast, armE)

def c2():
    message("2"); chappe(armS, southNorth, armN)

def c3():
    message("3"); chappe(armS, southNorth, armNE)

def c4():
    message("4"); chappe(armNE, westEast, armNW)

def c5():
    message("5"); chappe(armNE, westEast, armS)

def c6():
    message("6"); chappe(armS, northWestSouthEast, armSW)

def c7():
    message("7"); chappe(armSE, southWestNorthEast, armS)

def c8():
    message("8"); chappe(armSE, westEast, armSW)

def c9():
    message("9"); chappe(armN, southWestNorthEast, armNW)

# Punctuation
def fullStop():
    message("."); chappe(armS, southNorth, armW)

def comma():
    message(","); chappe(armNW, westEast, armE)

def semicolon():
    message(";"); chappe(armW, westEast, armNE)

def colon():
    message(":"); chappe(armS, southNorth, armE)

def questionMark():
    message("?"); chappe(armSW, westEast, armNE)

def exclamationMark():
    message("!"); chappe(armNW, westEast, armSE)

def leftParenthesis():
    message("("); chappe(armW, southNorth, armN)

def rightParenthesis():
    message(")"); chappe(armE, southNorth, armN)

def blank():
    message("' '"); chappe(armN, northWestSouthEast, armN)

erase(); capA(); a(); capB(); b(); capC(); c()
capD(); d(); capE(); e(); capF(); f()
capG(); g(); capH(); h(); capI(); i()
capJ(); j(); capK(); k(); capL(); l(); capM(); m()
capN(); n(); capO(); o(); capP(); p()
capQ(); q(); capR(); r(); capS(); s(); capT(); t()
capU(); u(); capV(); v(); capW(); w(); capX(); x()
capY(); y(); capZ(); z(); c0()
c1(); c2(); c3(); c4(); c5()
c6(); c7(); c8(); c9(); fullStop(); comma()
semicolon(); colon()
questionMark(); exclamationMark()
leftParenthesis(); rightParenthesis()
