from LibRobot import *

# Draw the alphabet of Chappe's optical telegraph
signalWidth = 2
gridSize = 5
armLength = 5  # Length of an articulated arm
# Grid size for a diagonal arm
diagonal = 4

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

def code(c):
    # Rectangle around the signal
    gs(gridSize); pw(1)
    fe(); fdn(6); fn(); fdn(9); fw(); fdn(6); fs(); fdn(9)
    translate(3, 1); label(c); translate(0, 5)
    pw(signalWidth)

def erase():
    gs(gridSize); translate(3, -6)

def chappeArm(arm):
    if arm == armN:
        fn(); gs(armLength); fd()
        translate(0, -1)
    elif arm == armNE:
        fne(); gs(diagonal); fd()
        translate(-1, -1)
    elif arm == armE:
        fe(); gs(armLength); fd()
        translate(-1, 0)
    elif arm == armSE:
        fse(); gs(diagonal); fd()
        translate(-1, 1)
    elif arm == armS:
        fs(); gs(armLength); fd()
        translate(0, 1)
    elif arm == armSW:
        fsw(); gs(diagonal); fd()
        translate(1, 1)
    elif arm == armW:
        fw(); gs(armLength); fd()
        translate(1, 0)
    elif arm == armNW:
        fnw(); gs(diagonal); fd()
        translate(1, -1)

def chappe(l, m, r):
    if m == southNorth:
        fs(); gs(armLength); fd()
        chappeArm(l)
        gs(armLength); translate(0, 1)
        fn(); gs(armLength); fd()
        chappeArm(r)
        gs(armLength); translate(0, -1)
    elif m == southWestNorthEast:
        fsw(); gs(diagonal); fd()
        chappeArm(l); gs(diagonal)
        translate(1, 1)
        fne(); gs(diagonal); fd()
        chappeArm(r); gs(diagonal)
        translate(-1, -1)
    elif m == westEast:
        fw(); gs(armLength); fd()
        chappeArm(l)
        gs(armLength); translate(1, 0)
        fe(); gs(armLength); fd()
        chappeArm(r)
        gs(armLength); translate(-1, 0)
    elif m == northWestSouthEast:
        fnw(); gs(diagonal); fd()
        chappeArm(l); gs(diagonal)
        translate(1, -1)
        fse(); gs(diagonal); fd()
        chappeArm(r); gs(diagonal)
        translate(-1, 1)
    fn()
    erase()

# Letters: capA() for capital A, a() for small a,
# etc.
def capA():
    code("A"); chappe(armN, westEast, armNE)

def a():
    code("a"); chappe(armNW, westEast, armN)

def capB():
    code("B"); chappe(armSW, southWestNorthEast, armNW)

def b():
    code("b"); chappe(armNE, northWestSouthEast, armSE)

def capC():
    code("C"); chappe(armS, westEast, armS)

def c():
    code("c"); chappe(armN, westEast, armN)

def capD():
    code("D"); chappe(armN, southWestNorthEast, armNE)

def d():
    code("d"); chappe(armNW, northWestSouthEast, armN)

def capE():
    code("E"); chappe(armE, southNorth, armE)

def e():
    code("e"); chappe(armW, southNorth, armW)

def capF():
    code("F"); chappe(armN, westEast, armNE)

def f():
    code("f"); chappe(armN, westEast, armNW)

def capG():
    code("G"); chappe(armN, northWestSouthEast, armN)

def g():
    code("g"); chappe(armN, southWestNorthEast, armN)

def capH():
    code("H"); chappe(armW, southNorth, armE)

def h():
    code("h"); chappe(armE, southNorth, armW)

def capI():
    code("I"); chappe(armS, southNorth, armSE)

def i():
    code("i"); chappe(armS, southNorth, armSW)

def capJ():
    code("J"); chappe(armSW, westEast, armSE)

def j():
    code("j"); chappe(armNW, westEast, armNE)

def capK():
    code("K"); chappe(armS, southNorth, armE)

def k():
    code("k"); chappe(armS, southNorth, armW)

def capL():
    code("L"); chappe(armE, southNorth, armN)

def l():
    code("l"); chappe(armW, southNorth, armN)

def capM():
    code("M"); chappe(armN, southWestNorthEast, armSE)

def m():
    code("m"); chappe(armSW, northWestSouthEast, armN)

def capN():
    code("N"); chappe(armS, northWestSouthEast, armNE)

def n():
    code("n"); chappe(armNW, southWestNorthEast, armS)

def capO():
    code("O"); chappe(armN, northWestSouthEast, armE)

def o():
    code("o"); chappe(armW, southWestNorthEast, armN)

def capP():
    code("P"); chappe(armNW, northWestSouthEast, armSW)

def p():
    code("p"); chappe(armSE, southWestNorthEast, armNE)

def capQ():
    code("Q"); chappe(armE, southNorth, armNW)

def q():
    code("q"); chappe(armW, southNorth, armNE)

def capR():
    code("R"); chappe(armS, southNorth, armE)

def r():
    code("r"); chappe(armS, southNorth, armW)

def capS():
    code("S"); chappe(armNE, northWestSouthEast, armSW)

def s():
    code("s"); chappe(armSE, southWestNorthEast, armNW)

def capT():
    code("T"); chappe(armSW, southWestNorthEast, armS)

def t():
    code("t"); chappe(armS, northWestSouthEast, armSE)

def capU():
    code("U"); chappe(armS, northWestSouthEast, armW)

def u():
    code("u"); chappe(armE, southWestNorthEast, armS)

def capV():
    code("V"); chappe(armS, westEast, armSW)

def v():
    code("v"); chappe(armSE, westEast, armS)

def capW():
    code("W"); chappe(armSW, northWestSouthEast, armSW)

def w():
    code("w"); chappe(armSE, southWestNorthEast, armSE)

def capX():
    code("X"); chappe(armNW, southWestNorthEast, armW)

def x():
    code("x"); chappe(armE, northWestSouthEast, armNE)

def capY():
    code("Y"); chappe(armS, southWestNorthEast, armS)

def y():
    code("y"); chappe(armS, northWestSouthEast, armS)

def capZ():
    code("Z"); chappe(armNW, southWestNorthEast, armNW)

def z():
    code("z"); chappe(armNE, northWestSouthEast, armNE)

# Digits
def c0():
    code("0"); chappe(armSE, westEast, armN)

def c1():
    code("1"); chappe(armW, westEast, armE)

def c2():
    code("2"); chappe(armS, southNorth, armN)

def c3():
    code("3"); chappe(armS, southNorth, armNE)

def c4():
    code("4"); chappe(armNE, westEast, armNW)

def c5():
    code("5"); chappe(armNE, westEast, armS)

def c6():
    code("6"); chappe(armS, northWestSouthEast, armSW)

def c7():
    code("7"); chappe(armSE, southWestNorthEast, armS)

def c8():
    code("8"); chappe(armSE, westEast, armSW)

def c9():
    code("9"); chappe(armN, southWestNorthEast, armNW)

# Punctuation
def fullStop():
    code("."); chappe(armS, southNorth, armW)

def comma():
    code(","); chappe(armNW, westEast, armE)

def semicolon():
    code(";"); chappe(armW, westEast, armNE)

def colon():
    code(":"); chappe(armS, southNorth, armE)

def questionMark():
    code("?"); chappe(armSW, westEast, armNE)

def exclamationMark():
    code("!"); chappe(armNW, westEast, armSE)

def leftParenthesis():
    code("("); chappe(armW, southNorth, armN)

def rightParenthesis():
    code(")"); chappe(armE, southNorth, armN)

def blank():
    code(" "); chappe(armN, northWestSouthEast, armN)

def newLine():
    gs(gridSize); gl()
    translate(0, -9)

textFont(geneva); textSize(9); gs(1); gt()
newLine()
capA(); a(); capB(); b(); capC(); c(); capD(); d()
capE(); e(); capF(); f(); newLine()
capG(); g(); capH(); h(); capI(); i(); capJ(); j()
capK(); k(); capL(); l(); newLine()
capM(); m(); capN(); n(); capO(); o(); capP(); p()
capQ(); q(); capR(); r(); newLine()
capS(); s(); capT(); t(); capU(); u(); capV(); v()
capW(); w(); capX(); x(); newLine()
capY(); y(); capZ(); z(); c0(); c1(); c2(); c3()
c4(); c5(); c6(); c7()
newLine()
c8(); c9(); fullStop(); comma(); semicolon()
colon(); questionMark()
exclamationMark()
leftParenthesis(); rightParenthesis(); st()
