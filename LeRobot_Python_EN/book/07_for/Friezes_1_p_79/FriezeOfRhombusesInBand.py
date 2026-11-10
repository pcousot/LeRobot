from LibRobot import *

# Draw a frieze of rhombuses in a band
# Move to the left of the frame
gl(); pu(); qtr(); fd(); pd()
# Drawing of the frieze of rhombuses between two
# horizontal lines
for l in range(13):
    # Drawing of the two west sides of the rhombus
    tetr(); fd(); qtl(); fd(); etl()
    # Drawing of the south line up to the east rhombus
    fd(); fd(); fd()
    # Back to the south tip of the rhombus
    ht(); fd(); fd(); fd()
    # Drawing of the two east sides of the rhombus
    tetr(); fd(); qtl(); fd(); tetr()
    # Drawing of the north line up to the east rhombus
    fd(); fd(); fd()
# Drawing of the last rhombus
tetr(); fd(); qtl(); fd(); qtl(); fd()
qtl(); fd(); st()
