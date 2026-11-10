from LibRobot import *

# Encode a message with a secret code
gridSize = 6

# Layout
def newLine():
    gl(); translate(0, -4)

def endOfWord():
    translate(2, 0)

# Drawing of the letters and digits
def letterA():
    fn(); translate(2, 0); fdn(2); translate(0, -1)
    cl(); cl(); cl(); cl()
    translate(1, -1)

def letterB():
    fn(); fdn(3); translate(0, -2); cr(); cr(); cr()
    cr(); translate(3, -1)

def letterC():
    translate(2, 0); fw(); fd(); cr(); cr(); cr()
    translate(1, -1)

def letterD():
    fn(); translate(2, 0); fdn(3); translate(0, -2)
    cl(); cl(); cl(); cl()
    translate(1, -1)

def letterE():
    translate(2, 0); fw(); fd(); cr(); cr(); cr()
    qtr(); fd(); fd()
    translate(3, -1)

def letterF():
    fn(); fdn(2); cr(); cr(); translate(-2, -1); fe()
    fd(); translate(2, -1)

def letterG():
    fn(); translate(2, 1); fd(); translate(0, -1)
    cl(); cl(); cl(); cl(); ht()
    fd(); cr(); translate(2, 1)

def letterH():
    fn(); fdn(3); translate(0, -2); cr(); cr(); fd()
    translate(1, 0)

def letterI():
    fn(); fdn(2); translate(0, 1); dp()
    translate(1, -3)

def letterJ():
    translate(1, 3); fs(); dp(); translate(0, -1)
    fdn(2); cr()
    translate(2, 1)

def letterK():
    fn(); fdn(3); translate(0, -2); fne(); fd()
    translate(-1, -1); fse()
    fd(); translate(1, 0)

def letterL():
    fn(); fdn(3); translate(1, -3)

def letterM():
    fn(); fdn(2); translate(0, -1); cr(); cr(); fd()
    translate(0, 1); fn()
    cr(); cr(); fd(); translate(1, 0)

def letterN():
    fn(); fdn(2); translate(0, -1); cr(); cr(); fd()
    translate(1, 0)

def letterO():
    fn(); translate(0, 1); cr(); cr(); cr(); cr()
    translate(3, -1)

def letterP():
    translate(0, -1); fn(); fdn(3); translate(0, -1)
    cr(); cr(); cr(); cr()
    translate(3, -1)

def letterQ():
    translate(2, -1); fn(); fdn(3); translate(0, -1)
    cl(); cl(); cl(); cl()
    translate(1, -1)

def letterR():
    fn(); fdn(2); translate(0, -1); cr(); cr()
    translate(1, -1)

def letterS():
    fe(); fd(); etl(); cl(); fw(); fd(); fnw()
    cr(); etr(); fd()
    translate(1, -2)

def letterT():
    translate(0, 3); fs(); fd(); fe(); fd()
    translate(-1, 0); fs(); fd(); cl()
    cl(); translate(1, -1)

def letterU():
    translate(0, 2); fs(); fd(); cl(); cl()
    translate(0, -1); fdn(2)
    translate(1, -2)

def letterV():
    translate(1, 0); fnw(); fd(); fn(); fd()
    translate(1, -2); fne(); fd(); fn()
    fd(); translate(1, -2)

def letterW():
    translate(1, 0); fnw(); fd(); fn(); fd()
    translate(1, -2); fne(); fd(); fn()
    fd(); translate(0, -1); fse(); fd(); fne(); fd()
    fn(); fd(); translate(1, -2)

def letterX():
    fne(); fdn(2); translate(0, -2); fnw(); fdn(2)
    translate(3, -2)

def letterY():
    translate(0, 2); fs(); fd(); cl(); cl(); fd()
    ht(); fdn(2); cr()
    translate(2, 1)

def letterZ():
    translate(0, 2); fe(); fdn(2); fsw(); fdn(2); fe()
    fdn(2)
    translate(1, 0)

def digit0():
    translate(1, 0); fw(); cr(); fd(); cr(); cr()
    fd(); cr(); translate(2, 0)

def digit1():
    translate(1, 0); fn(); fdn(3); fsw(); fd()
    translate(2, -2)

def digit2():
    translate(0, 2); fn(); cr(); cr(); fsw(); fdn(2)
    fe(); fdn(2)
    translate(1, 0)

def digit3():
    translate(0, 3); fne(); cr(); cr(); fw(); fd()
    translate(1, 0); fe(); cr()
    cr(); fd(); translate(3, 0)

def digit4():
    translate(2, 0); fn(); fdn(3); fsw(); fdn(2); fe()
    fdn(2)
    translate(1, -1)

def digit5():
    fe(); fd(); cl(); cl(); fd(); qtr(); fd()
    qtr(); fd(); fd()
    translate(1, -3)

def digit6():
    translate(0, 1); fn(); cr(); cr(); cr(); cr()
    fd(); cr(); fd()
    translate(1, -1)

def digit7():
    translate(0, 3); fe(); fdn(2); fs(); fd(); fsw()
    fd(); fs(); fd()
    translate(2, 0)

def digit8():
    translate(1, 0); fw(); cr(); cr(); fd(); cr()
    cr(); fd(); translate(0, 2)
    fnw(); cr(); cr(); cr(); translate(2, -2)

def digit9():
    translate(2, 2); fs(); cr(); cr(); cr(); cr()
    fd(); cr(); fd()
    translate(3, 0)

# coding
def blank():
    digit8()

def a():
    endOfWord()

def b():
    digit6()

def c():
    letterH()

def d():
    letterE()

def e():
    digit1()

def f():
    letterL()

def g():
    letterN()

def h():
    letterO()

def i():
    letterQ()

def j():
    letterV()

def k():
    digit3()

def l():
    letterY()

def m():
    digit9()

def n():
    letterA()

def o():
    letterW()

def p():
    letterK()

def q():
    letterP()

def r():
    letterZ()

def s():
    digit5()

def t():
    letterU()

def u():
    letterF()

def v():
    letterB()

def w():
    digit4()

def x():
    letterI()

def y():
    letterM()

def z():
    digit7()

def c0():
    letterJ()

def c1():
    letterG()

def c2():
    letterT()

def c3():
    letterR()

def c4():
    letterC()

def c5():
    digit0()

def c6():
    letterX()

def c7():
    letterS()

def c8():
    digit2()

def c9():
    letterD()

gt(); newLine(); gs(gridSize)
m(); e(); s(); s(); a(); g(); e(); blank()
t()
r(); e(); s(); blank(); s()
e(); c(); r(); e(); t(); blank(); st()
