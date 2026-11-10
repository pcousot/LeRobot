from LibRobot import *

# Draw a family of dogs out for a walk
def dog():
    # Back outline of the front leg
    fdn(2); qtr()
    # Belly
    fdn(3); cl()
    # Hind leg
    ht(); fdn(3); qtl(); fd(); qtl(); fdn(4)
    # Tail
    fdn(2); cr(); ht(); cl(); cr()
    # Back
    fdn(3); cr()
    # Head
    # Ear
    fdn(2); qtl(); fd(); qtl(); fd()
    # Eye
    pu(); fd(); dc(); ht(); fd(); pd(); qtl()
    fd(); qtl(); fd()
    # Muzzle
    qtr(); fdn(2); qtl(); fdn(2); qtl()
    # Mouth
    cl(); ht(); cr(); ht(); fdn(2); cr()
    # Front outline of the front leg
    fdn(3); qtl(); fd()

gb(); gl(); pu(); qtr(); fdn(7); qtl(); pd()
# Father
gs(18); dog(); pu(); fdn(9); fn(); pd()
# Mother
gs(14); dog(); pu(); fdn(8); fn(); pd()
# Puppies
gs(4); dog(); pu(); fdn(11); fn(); pd(); dog()
pu(); fdn(11); fn(); pd(); dog(); st()
