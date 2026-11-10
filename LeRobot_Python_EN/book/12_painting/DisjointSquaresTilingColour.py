from LibRobot import *

# Tiling of disjoint squares in colour
gridSize = 19
penSize = 15
lineLength = 23

# Draw a column of big dots of the colour of the
# pen, then go on to the next column
def column():
    gl()
    for i in range(lineLength):
        fd(); dp()
    qtl(); fd(); qtr()

gs(gridSize); pw(penSize); gb(); qtr(); pu()
pc(yellow); column(); pc(blue); column()
pc(violet); column(); pc(green); column()
pc(red); column(); pc(indigo); column()
pc(black); column()
pc(indigo); column(); pc(red); column()
pc(green); column(); pc(violet); column()
pc(blue); column(); pc(yellow); column()
st()
