from LibRobot import *

# Tiling of Golomb: 1 square of side 1, 2 squares of
# side 2, ..., 10 squares of side 10, graduated border

# Draw a square of side n and move forward by n
def square(n):
    for i in range(4):
        fdn(n); qtl()
    fdn(n)

# Draw a quarter ring of squares of even side n
def evenQuarterRing(n):
    for i in range(n // 2):
        square(n)
    fdn(n // 2); qtl(); fdn(n // 2)
    for i in range(n // 2):
        square(n)
    qtl(); fdn(n // 2 * (n + 1))
    qtl(); fdn(n // 2 * (n + 1))

# Draw a quarter ring of squares of odd side n
def oddQuarterRing(n):
    for i in range(n // 2):
        square(n)
    fdn(n); qtl(); fdn(n)
    for i in range(n // 2):
        square(n)
    qtl(); fdn((n + 1) // 2 * n)
    qtl(); fdn((n + 1) // 2 * n)

# Draw the n quarter rings of the tiling
def tiling(n):
    fe()
    for i in range(1, n + 1):
        if i % 2 == 1:
            oddQuarterRing(i)
        else:
            evenQuarterRing(i)
        if i != n:
            fdn(i + 1); qtl()

# Graduate the four sides of the large square
def markTheBorder(n):
    l = valGsX()
    m = (n + 1) // 2 * n if n % 2 == 1 else (n + 1) * (n // 2)
    for i in range(4):
        for j in range(m):
            gs(2); qtr(); fd(); ht(); fd(); qtr()
            gs(l); fd()
        gs(2); qtr(); fd(); ht(); fd(); qtr()
        gs(l); qtl()

gt(); gl(); pu(); ht(); fd(); ht(); pd()
gs(3); tiling(10); qtl(); markTheBorder(10); st()
