from LibRobot import *

# Draw a frieze of tildes (second mistake)

# Draw a tilde-shaped pattern ~
def tilde():
    etr(); fd(); etr(); fd()
    qtr(); fd(); fd(); qtl()
    fd(); etl(); fd()

for i in range(13):
    tilde()
    # Back up to the next tilde's start
    pu(); tetl(); fd(); pd()
st()
