from LibRobot import *

# Draw a frieze of chained parallelograms
def parallelogramFrieze():
    for i in range(14):
        # Parallelogram
        etr(); fd(); etr(); fd(); tetr(); fd()
        etr(); fd()
        # Go to the NE corner
        tetr(); fd(); etr(); fd()
        # Link to the SW corner of the next parallelogram
        etr(); fd(); tetl()

gl(); parallelogramFrieze(); ht()
parallelogramFrieze(); st()
