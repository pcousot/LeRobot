from LibRobot import *

# Von Koch snowflake
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        qtl()
        segment(n - 1)
        etr()
        segment(n - 1)
        etr()
        segment(n - 1)
        etr()
        segment(n - 1)
        etr()
        segment(n - 1)
        qtl()
        segment(n - 1)

def square(n):
    segment(n)
    qtr()
    segment(n)
    qtr()
    segment(n)
    qtr()
    segment(n)

def goToStart():
    pu(); fdn(4); qtr(); pd()

goToStart()
gs(1)
square(3)
st()
