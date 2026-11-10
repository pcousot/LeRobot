from LibRobot import *

# Draw the bracket of a tennis tournament
l = 5  # Length of a horizontal line

# Draw a bracket for a tournament of n players
def bracket(n):
    # Tip of the brace, for the winner
    fdn(l)
    if n > 1:
        # Upper branch of the brace
        qtl(); fdn(n); qtr()
        # Upper sub-bracket, containing
        # half of the players
        bracket(n // 2)
        # Go back to the centre of the brace
        pu(); qtl(); fdn(-n); qtr(); pd()
        # Lower branch of the brace
        qtr(); fdn(n); qtl()
        # Lower sub-bracket, containing the
        # rest of the players
        bracket(n - n // 2)
        # Go back to the centre of the brace
        pu(); qtr(); fdn(-n); qtl(); pd()
    # Go back to the end of the tip
    fdn(-l)

gs(3); fe(); bracket(16); st()
