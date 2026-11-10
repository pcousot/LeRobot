from LibRobot import *

# Draw a vertical arrow
def feather():
    fd(); tetl(); fd(); pu(); tetl(); fd(); fd()
    tetl(); pd(); fd(); etr()

def fletching():
    for i in range(5):
        feather()

def shaft():
    for i in range(10):
        fd()

def head():
    qtl(); fd(); tetr(); fd(); qtr(); fd()
    tetr(); fd()

gb(); fletching(); shaft(); head(); st()
