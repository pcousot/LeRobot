from LibRobot import *

# Draw a cube in perspective
# Left edge, front face
pw(2); fdn(6)
# Left edge, top face
etl(); fdn(3); ht(); fdn(3)
# Top edge, front face
etl(); fdn(6)
# Right edge, top face
tetl(); fdn(3); ht(); fdn(3)
# Right edge, front face
etr(); fdn(6)
# Right edge, bottom face
pw(1); tetr(); fdn(3); ht(); fdn(3)
# Bottom edge, front face
pw(2); tetr(); fdn(6)
# Bottom edge, left face
etr(); fdn(3)
# Back edge, left face
etr(); fdn(6)
# Back edge, top face
qtr(); fdn(6)
# Right edge, back face
pw(1); qtr(); fdn(6)
# Bottom edge, back face
qtr(); fdn(6); st()
