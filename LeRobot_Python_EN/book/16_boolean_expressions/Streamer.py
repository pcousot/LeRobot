from LibRobot import *

# Draw a streamer
def drawStreamer(l):
    for i in range(1, 2 * l + 1):
        if i <= l:
            gs(i)
        else:
            gs(2 * l + 1 - i)
        if i % 2 == 1:
            # Upper semicircle
            cr(); cr()
        # Lower semicircle
        else:
            cl(); cl()

gl(); drawStreamer(13); st()
