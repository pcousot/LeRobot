from LibRobot import *

# Draw and paint a stylized flower
gridSize = 12
stemThickness = 3
edgeThickness = 1

gb(); gs(gridSize)
# Bottom of the stem
pw(stemThickness); qtr(); cl()
fd(); fd(); fd()
# Right leaf:
# draw the outline
pw(edgeThickness); cr(); qtr(); cr()
# paint the inside
pc(green); etl(); paint(); tetr()
# Left leaf:
# draw the outline
pc(black); cl(); qtl(); cl()
# paint the inside
pc(green); etr(); paint(); tetl()
# Top of the stem
pc(black); pw(stemThickness)
fd(); fd(); fd(); fd()
# Centre:
# draw the outline of the centre
pw(edgeThickness); qtr()
cl(); cl(); cl(); cl()
# petals
pc(black); qtr(); cl(); cl(); cl()
pc(violet); etr(); paint(); etr()
pc(black); qtr(); cl(); cl(); cl()
pc(violet); etr(); paint(); etr()
pc(black); qtr(); cl(); cl(); cl()
pc(violet); etr(); paint(); etr()
pc(black); qtr(); cl(); cl(); cl()
pc(violet); etr(); paint(); etr()
# paint the inside of the centre
qtr(); pc(yellow); paint()
st()
