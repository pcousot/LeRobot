from LibRobot import *

# Decode a message written with a secret code
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

# decoding
def blank():
    letterA()

def a():
    letterN()

def b():
    letterV()

def c():
    digit4()

def d():
    digit9()

def e():
    letterD()

def f():
    letterU()

def g():
    digit1()

def h():
    letterC()

def i():
    letterX()

def j():
    digit0()

def k():
    letterP()

def l():
    letterF()

def m():
    letterY()

def n():
    letterG()

def o():
    letterH()

def p():
    letterQ()

def q():
    letterI()

def r():
    digit3()

def s():
    digit7()

def t():
    digit2()

def u():
    letterT()

def v():
    letterJ()

def w():
    letterO()

def x():
    digit6()

def y():
    letterL()

def z():
    letterR()

def c0():
    digit5()

def c1():
    letterE()

def c2():
    digit8()

def c3():
    letterK()

def c4():
    letterW()

def c5():
    letterS()

def c6():
    letterB()

def c7():
    letterZ()

def c8():
    endOfWord()

def c9():
    letterM()

gt(); newLine(); gs(gridSize)
c9(); c1(); c5(); c5(); blank(); n(); c1()
c8()
u(); z(); c1(); c5(); c8()
c5(); c1(); h(); z(); c1(); u(); c8(); st()
