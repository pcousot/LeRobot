from LibRobot import *

# Draw a frieze of tildes (first mistake)

# Draw a tilde-shaped pattern ~
def tilde():
    etr(); fd(); etr(); fd()
    qtr(); fd(); fd(); qtl()
    fd(); etl(); fd()

for i in range(10):
    tilde()
st()
