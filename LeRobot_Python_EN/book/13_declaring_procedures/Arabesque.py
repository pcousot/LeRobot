from LibRobot import *

# Drawing of an arabesque
gridSize = 10
thickLineWidth = 3

# Jump forward n positions on the grid
def jump(n):
    pu(); fdn(n); pd()

# Draw a circle of radius r centred on the robot
# with the pen thickness thickness
def circle(r, thickness):
    gs(r * gridSize); pw(thickness)
    pu(); fd(); qtl(); pd()
    cl(); cl(); cl(); cl()
    pu(); qtl(); fd(); ht(); pd()
    gs(gridSize); pw(thickLineWidth)

# Quarter of an eight-pointed star circumscribed
# about the eight small circles
def quarterStar():
    fd(); etr(); fd(); qtl(); fd(); etr(); fd()

# Half of an eight-pointed star circumscribed
# about the eight small circles
def halfStar():
    quarterStar(); qtl(); quarterStar()

# Circle inscribed in an eighth of the pattern in
# direction S, W, N, E
def evenSmallCircle():
    etl(); jump(3); circle(2, 1); ht(); jump(3)
    tetl()

# Eighth of the pattern in direction S, W, N, E
def evenStar():
    etr(); fd(); evenSmallCircle(); halfStar()
    fd(); etl(); fd(); ht(); pu(); fd()
    fdn(3); ht(); pd(); fd()
    etl(); fd(); halfStar(); fd(); tetr()
    fdn(2)

# Circle inscribed in an eighth of the pattern in
# direction SW, NW, NE, SE
def oddSmallCircle():
    etl(); jump(2); etl(); circle(2, 1); etr()
    ht(); jump(2); tetl()

# Eighth of the pattern in direction SW, NW, NE, SE
def oddStar():
    etr(); fd(); oddSmallCircle(); halfStar()
    fd(); tetr(); pu(); fd(); tetr(); pd()
    fd(); halfStar(); fd(); tetr(); fd()

# Pattern made of 2 stars (S, SW) or (W, NW) or
# (N, NE) or (E, SE)
def pattern():
    evenStar()
    fdn(3); etr(); fdn(4); qtr()
    oddStar()
    fdn(3); etr(); fdn(5); qtr()

gs(gridSize)
gb(); fn(); pu(); fdn(2); pd()
pw(thickLineWidth)
# Small octagon and its inner pattern
for i in range(4):
    pattern()
# Go to the centre of the concentric circles
qtr(); fd(); qtl(); jump(11)
# Concentric circles
circle(3, 1)
st()
