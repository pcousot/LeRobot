from LibRobot import *

# Flocon de Von Koch
l = 3

def segment(n):
    if n == 0:
        av()
    elif tw() or te():
        lg(l)
        segment(n - 1)
        lgRT(l, 60)
        phtg()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        lg(l)
        phtg()
        segment(n - 1)
    elif tne() or tsw():
        lgRT(l, 60)
        segment(n - 1)
        pqtg()
        segment(n - 1)
        lg(l)
        p3htd()
        segment(n - 1)
        lgRT(l, 60)
        phtg()
        segment(n - 1)
    elif tnw() or tse():
        lgRT(l, 60)
        segment(n - 1)
        lg(l)
        phtg()
        segment(n - 1)
        lgRT(l, 60)
        p3htd()
        segment(n - 1)
        pqtg()
        segment(n - 1)
    else:
        biiip()

def triangle(n):
    pqtd()
    lg(l)
    segment(n)
    lgRT(l, 60)
    p3htg()
    segment(n)
    pqtg()
    segment(n)

eb(); ag(); triangle(4); st()
