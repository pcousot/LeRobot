from LibRobot import *

# Draw a frieze of Z's
gl()
for m in range(5):
    # Z leaning to the left
    etr(); fd(); tetr(); fd(); fd(); tetl()
    fd()
    # Next pattern
    pu(); etl(); fd(); pd()
    # Upright Z
    qtr(); fd(); qtr(); fd(); fd(); qtl(); fd()
    # Next pattern
    pu(); qtl(); fd(); pd()
    # Reversed Z leaning to the right
    tetr(); fd(); tetl(); fd(); fd(); tetr()
    fd()
    # Next pattern
    pu(); etr(); fd(); qtl(); pd()
    # Upright reversed Z
    fd(); qtl(); fd(); fd(); qtr(); fd()
    # Next pattern
    pu(); qtr(); fd(); ht(); pd()
st()
