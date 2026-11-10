from LibRobot import *

# Draw a frieze of rhombuses

# Draw a saw tooth /\
def tooth():
    fd(); fd(); qtr(); fd(); fd(); qtl()

# Draw a saw-tooth frieze /\/\/\/\...
def saw():
    for i in range(10):
        tooth()

# Draw the frieze of rhombuses
def frieze():
    # Move to the left of the frame, facing NE
    gl(); etr()
    # Draw the frieze of rhombuses in halves
    for j in range(2):
        saw()
        # Draw the end
        etl(); fd(); fd(); tetl()

frieze(); st()
