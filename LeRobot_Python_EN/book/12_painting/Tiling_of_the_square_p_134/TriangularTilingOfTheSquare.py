from LibRobot import *

# Triangular tiling of the square
gridSize = 24

gs(gridSize)
for i in range(4):
    # Small black triangle
    fd(); qtr(); fd(); tetr(); fd(); tetr()
    pu(); fd(); etl(); paint(); tetl(); fd()
    ht(); pd()
    # Big white triangle
    fdn(2); qtr(); fdn(2); tetr(); fdn(2)
    # Small white triangle
    fd(); tetr(); fd(); qtr(); fd(); tetr()
    # Big triangle, black tip
    fdn(2); tetr(); fdn(2); qtr(); fdn(2); tetr()
    pu(); fd(); qtl(); paint(); qtl(); fd()
    ht(); pd(); etr()
st()
