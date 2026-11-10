from LibRobot import *

# Von Koch snowflake
l = 3

def segment(n):
    if n == 0:
        fd()
    elif tw() or te():
        gs(l)
        segment(n - 1)
        gsRT(l, 60)
        etl()
        segment(n - 1)
        qtr()
        segment(n - 1)
        gs(l)
        etl()
        segment(n - 1)
    elif tne() or tsw():
        gsRT(l, 60)
        segment(n - 1)
        qtl()
        segment(n - 1)
        gs(l)
        tetr()
        segment(n - 1)
        gsRT(l, 60)
        etl()
        segment(n - 1)
    elif tnw() or tse():
        gsRT(l, 60)
        segment(n - 1)
        gs(l)
        etl()
        segment(n - 1)
        gsRT(l, 60)
        tetr()
        segment(n - 1)
        qtl()
        segment(n - 1)
    else:
        longBeep()

def triangle(n):
    qtr()
    gs(l)
    segment(n)
    gsRT(l, 60)
    tetl()
    segment(n)
    qtl()
    segment(n)

gb(); gl(); triangle(4); st()
