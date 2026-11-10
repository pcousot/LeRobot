# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Alphabet (in capital letters), page 8.              *
# *                                                     *
# *******************************************************
from LibRobot import *

def fd5times():
    # Move straight forward 5 times with the pen up
    pu(); fd(); fd(); fd(); fd(); fd()

def l1():
    # Go to the beginning of the first line
    gt(); gl(); fs(); fd5times(); fn()

def l2():
    # Go to the beginning of the second line
    gt(); gl(); fs(); fd5times(); fd5times(); fn()

def l3():
    # Go to the beginning of the third line
    gt(); gl(); fs(); fd5times(); fd5times(); fd5times(); fn()

def l4():
    # Go to the beginning of the fourth line
    gt(); gl(); fs(); fd5times(); fd5times(); fd5times(); fd5times(); fn()

def a():
    # Draw the letter A
    pd(); fd(); fd(); qtr(); fd(); fd(); ht(); fd(); fd(); qtr(); fd(); cr()
    cr(); fd(); fd(); fd(); pu(); qtl(); fd(); qtl()

def b():
    # Draw the letter B
    pd(); fd(); fd(); fd(); fd(); qtr(); fd(); cr(); cr(); fd(); ht(); fd()
    cr(); cr(); fd(); ht(); pu(); fd(); fd(); fd(); qtl()

def c():
    # Draw the letter C
    pu(); qtr(); fd(); cl(); ht(); pd(); cr(); cr(); fd(); fd(); cr(); cr()
    pu(); fd(); fd(); fd(); qtl(); fd(); qtl()

def d():
    # Draw the letter D
    pd(); fd(); fd(); fd(); fd(); qtr(); fd(); cr(); fd(); fd(); cr(); fd()
    pu(); ht(); fd(); fd(); fd(); qtl()

def e():
    # Draw the letter E
    pd(); qtr(); fd(); fd(); ht(); fd(); fd(); qtr(); fd(); fd(); qtr(); fd()
    ht(); fd(); qtr(); fd(); fd(); qtr(); fd()
    fd(); pu(); qtr(); fd(); fd(); fd(); fd(); qtl(); fd(); qtl()

def f():
    # Draw the letter F
    pd(); fd(); fd(); qtr(); fd(); ht(); fd(); qtr(); fd(); fd(); qtr(); fd()
    fd(); pu(); qtr(); fd(); fd(); fd(); cl(); qtl()

def g():
    # Draw the letter G
    pu(); fd(); fd(); qtr(); fd(); pd(); fd(); qtr(); fd(); cr(); cr(); fd()
    fd(); cr(); cr(); pu(); fd(); fd(); cl(); qtl()

def h():
    # Draw the letter H
    pd(); fd(); fd(); qtr(); fd(); fd(); ht(); fd(); fd(); qtr(); fd(); fd()
    pu(); qtr(); fd(); fd(); qtr(); pd(); fd(); fd(); fd(); fd(); pu(); qtl()
    fd(); qtl()

def i():
    # Draw the letter I
    pd(); qtr(); fd(); fd(); ht(); fd(); qtr(); fd(); fd(); fd(); fd(); qtl()
    fd(); ht(); fd(); fd(); pu(); qtr(); fd(); fd(); fd(); cl(); qtl()

def j():
    # Draw the letter J
    pu(); fd(); fd(); fd(); fd(); qtr(); pd(); fd(); fd(); qtr(); fd(); fd()
    fd(); cr(); cr(); pu(); ht(); cl(); fd(); fd(); qtl()

def k():
    # Draw the letter K
    pd(); fd(); fd(); fd(); fd(); ht(); fd(); fd(); qtl(); cl(); cr(); ht()
    cl(); cr(); ht(); cr(); cl(); pu(); fd(); qtl()

def l():
    # Draw the letter L
    pd(); fd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); fd(); qtl(); fd()
    fd(); pu(); fd(); qtl()

def m():
    # Draw the letter M
    pd(); fd(); fd(); fd(); fd(); ht(); cl(); cl(); ht(); fd(); fd(); fd()
    fd(); pu(); qtl(); fd(); qtl()

def n():
    # Draw the letter N
    pd(); fd(); fd(); fd(); fd(); qtr(); cr(); cl(); qtl(); fd(); fd(); ht()
    fd(); fd(); fd(); fd(); pu(); qtl(); fd(); qtl()

def o():
    # Draw the letter O
    pu(); qtr(); fd(); ht(); pd(); cr(); fd(); fd(); cr(); cr(); fd(); fd()
    cr(); pu(); ht(); fd(); fd(); qtl()

def p():
    # Draw the letter P
    pd(); fd(); fd(); fd(); fd(); qtr(); fd(); cr(); cr(); fd(); pu(); ht()
    fd(); fd(); fd(); qtr(); fd(); fd(); ht()

def q():
    # Draw the letter Q
    pu(); qtr(); fd(); qtl(); fd(); ht(); pd(); cl(); ht(); pu(); fd(); pd()
    cr(); fd(); fd(); cr(); cr(); fd(); fd(); cr(); pu(); ht(); fd(); fd()
    qtl()

def r():
    # Draw the letter R
    pd(); fd(); fd(); fd(); fd(); qtr(); fd(); cr(); cr(); fd(); ht(); fd()
    cr(); fd(); pu(); qtl(); fd(); qtl()

def s():
    # Draw the letter S
    pu(); fd(); ht(); pd(); cl(); cl(); cl(); cr(); cr(); cr(); pu(); fd()
    fd(); cl(); qtl()

def t():
    # Draw the letter T
    pu(); qtr(); fd(); qtl(); pd(); fd(); fd(); fd(); fd(); qtl(); fd(); ht()
    fd(); fd(); pu(); qtr(); fd(); fd(); fd(); cl(); qtl()

def u():
    # Draw the letter U
    pu(); fd(); pd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); cl(); cl()
    fd(); fd(); fd(); pu(); ht(); fd(); fd(); fd(); cl(); qtl()

def v():
    # Draw the letter V
    pu(); fd(); pd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); qtl(); cr()
    ht(); cr(); qtl(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); pu(); cl()
    qtl()

def w():
    # Draw the letter W
    pd(); fd(); fd(); fd(); fd(); ht(); fd(); fd(); fd(); fd(); qtl(); cl()
    fd(); fd(); ht(); fd(); fd(); cl(); qtl(); fd(); fd(); fd()
    fd(); ht(); fd(); fd(); fd(); fd(); pu(); qtl(); fd(); qtl()

def x():
    # Draw the letter X
    pd(); fd(); cr(); cl(); fd(); pu(); qtl(); fd(); fd(); qtl(); pd(); fd()
    cl(); cr(); fd(); pu(); qtl(); fd(); qtl()

def y():
    # Draw the letter Y
    pu(); fd(); ht(); pd(); cl(); cl(); fd(); fd(); fd(); ht(); fd(); cr()
    cr(); fd(); pu(); qtr(); fd(); fd(); fd(); qtr(); fd(); fd(); fd(); fd()
    ht()

def z():
    # Draw the letter Z
    pd(); qtr(); fd(); fd(); ht(); fd(); fd(); qtr(); fd(); cr(); cl(); fd()
    qtl(); fd(); fd(); pu(); ht(); fd(); fd(); qtr(); fd(); fd(); fd(); cl()
    qtl()

# Alphabet
l1(); a(); b(); c(); d(); e(); f(); g()
l2(); h(); i(); j(); k(); l(); m(); n()
l3(); o(); p(); q(); r(); s(); t(); u()
l4(); v(); w(); x(); y(); z()
st()
# Alphabet
