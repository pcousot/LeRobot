from LibRobot import *

# Draw crosses on the edge and at the centre of the frame
gl(); dc()  # middle of the left edge
gr(); dc()  # middle of the right edge
gc(); gt(); dc()  # middle of the top edge
gb(); dc()  # middle of the bottom edge
gt(); gl(); dc()  # in the top left corner
gr(); dc()  # in the top right corner
gb(); gl(); dc()  # in the bottom left corner
gr(); dc()  # in the bottom right corner
gc(); dc()  # at the centre
st()
