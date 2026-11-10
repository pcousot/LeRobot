from LibRobot import *

# Draw a binary tree

# Draw a tree with l leaves, root at the top,
# the leaves at the bottom, assuming that l >= 1,
# the tree being reduced to a point when l = 1. Before
# and after the drawing, the robot must be placed at the
# root of the tree, facing north with its pen
# down.
def tree(l):
    if l == 1:
        # Draw a tree reduced to a single point (without
        # changing the position and orientation of the robot)
        dp()
    # With the robot placed at the root of the tree,
    # facing north with its pen down, draw
    # the south-west branch
    else:
        tetl(); fdn(l)
        # Turn the robot to face north
        tetr()
        # Draw the left subtree having l / 2 >= 1
        # leaves, the robot being placed at the root of the
        # subtree, facing north with its pen
        # down
        tree(l // 2)
        # Given that the robot is placed at the root of the
        # left subtree, facing north with its pen
        # down, go back to the root of the tree, without
        # drawing anything
        pu(); etr(); fdn(l)
        # With the robot placed at the root of the tree,
        # facing north-east with its pen up,
        # draw the south-east branch
        pd(); qtr(); fdn(l)
        # Turn the robot to face north
        tetl()
        # Draw the right subtree having l - l / 2 >= 1
        # leaves, the robot being placed at the root of the
        # subtree, facing north with its pen
        # down
        tree(l - l // 2)
        # Place the robot at the root of the tree, facing
        # north with its pen down
        pu(); etl(); fdn(l); etr(); pd()

gsX(2); gsY(3); gt(); tree(32); st()
