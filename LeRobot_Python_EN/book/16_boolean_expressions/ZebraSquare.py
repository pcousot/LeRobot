from LibRobot import *

# Draw a zebra-striped square
gs(3)
for i in range(4):
    for j in range(1, 10):
        fdn(3 * j); qtr(); fdn(3 * j); tetr()
        fdn(3 * j); tetr()
        if j % 2 == 1:
            pu(); fdn(3 * j - 1); qtr(); fd()
            paint(); ht(); fd(); qtl()
            fdn(3 * j - 1); ht(); pd()
        etr(); fdn(3 * j); tetr(); fdn(3 * j)
        qtr(); fdn(3 * j)
        if not j % 2 == 1:
            pu(); tetr(); fdn(3 * j - 1); tetr()
            fd(); paint(); ht()
            fd(); tetl(); fdn(3 * j - 1); etr(); pd()
        qtr()
    qtr()
st()
