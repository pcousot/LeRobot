from LibRobot import *

# Figure of the book: computing 1 + 2 + ... + 10
# with a 10 x 11 rectangle half of which is tiled
nmax = 10

def square():
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    qtr(); fd()

gb(); gl(); pu(); fd(); qtr(); fd(); qtl()
pd()
for i in range(1, nmax + 1):
    for j in range(i):
        square()
    translate(1, -i)
# Outer square
fdn(nmax + 1); qtl()
fdn(nmax); qtl()
fdn(nmax + 1); qtl()
fdn(nmax); qtl(); pu()
fdn(nmax + 1); qtl()
fdn(nmax); qtl()
tetr(); pc(yellow); paint(); st()
