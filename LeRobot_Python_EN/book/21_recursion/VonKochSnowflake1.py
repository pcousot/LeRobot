from LibRobot import *

# Von Koch snowflake
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        etl()
        segment(n - 1)
        qtr()
        segment(n - 1)
        etl()
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
    pu(); etr(); fdn(6); tetr(); pd()

goToStart()
gs(3)
square(3)
st()
