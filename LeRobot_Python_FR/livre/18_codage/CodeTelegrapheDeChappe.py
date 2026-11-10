from LibRobot import *

# Dessiner l'alphabet du télégraphe optique de Chappe
epaisseurSignal = 2
tailleGrille = 5
longueurBras = 5  # Longueur d'un bras articulé
# Taille de la grille pour un bras en diagonale
diagonale = 4

# Position des bras extrêmes
nord = 1
nordEst = 2
est = 3
sudEst = 4
sud = 5
sudOuest = 6
ouest = 7
nordOuest = 8

# Position du bras central
sudNord = 1
sudOuestNordEst = 2
ouestEst = 3
nordOuestSudEst = 4

def code(c):
    # Rectangle autour du signal
    lg(tailleGrille); ec(1)
    pe(); avf(6); pn(); avf(9); pw(); avf(6); ps(); avf(9)
    translater(3, 1); ecrire(c); translater(0, 5)
    ec(epaisseurSignal)

def effacer():
    lg(tailleGrille); translater(3, -6)

def chappeCote(d):
    if d == nord:
        pn(); lg(longueurBras); av()
        translater(0, -1)
    elif d == nordEst:
        pne(); lg(diagonale); av()
        translater(-1, -1)
    elif d == est:
        pe(); lg(longueurBras); av()
        translater(-1, 0)
    elif d == sudEst:
        pse(); lg(diagonale); av()
        translater(-1, 1)
    elif d == sud:
        ps(); lg(longueurBras); av()
        translater(0, 1)
    elif d == sudOuest:
        psw(); lg(diagonale); av()
        translater(1, 1)
    elif d == ouest:
        pw(); lg(longueurBras); av()
        translater(1, 0)
    elif d == nordOuest:
        pnw(); lg(diagonale); av()
        translater(1, -1)

def chappe(g, m, d):
    if m == sudNord:
        ps(); lg(longueurBras); av()
        chappeCote(g)
        lg(longueurBras); translater(0, 1)
        pn(); lg(longueurBras); av()
        chappeCote(d)
        lg(longueurBras); translater(0, -1)
    elif m == sudOuestNordEst:
        psw(); lg(diagonale); av()
        chappeCote(g); lg(diagonale)
        translater(1, 1)
        pne(); lg(diagonale); av()
        chappeCote(d); lg(diagonale)
        translater(-1, -1)
    elif m == ouestEst:
        pw(); lg(longueurBras); av()
        chappeCote(g)
        lg(longueurBras); translater(1, 0)
        pe(); lg(longueurBras); av()
        chappeCote(d)
        lg(longueurBras); translater(-1, 0)
    elif m == nordOuestSudEst:
        pnw(); lg(diagonale); av()
        chappeCote(g); lg(diagonale)
        translater(1, -1)
        pse(); lg(diagonale); av()
        chappeCote(d); lg(diagonale)
        translater(-1, 1)
    pn()
    effacer()

# Lettres : am () pour A majuscule, a () pour a
# minuscule, etc.
def am():
    code("A"); chappe(nord, ouestEst, nordEst)

def a():
    code("a"); chappe(nordOuest, ouestEst, nord)

def bm():
    code("B"); chappe(sudOuest, sudOuestNordEst, nordOuest)

def b():
    code("b"); chappe(nordEst, nordOuestSudEst, sudEst)

def cm():
    code("C"); chappe(sud, ouestEst, sud)

def c():
    code("c"); chappe(nord, ouestEst, nord)

def dm():
    code("D"); chappe(nord, sudOuestNordEst, nordEst)

def d():
    code("d"); chappe(nordOuest, nordOuestSudEst, nord)

def em():
    code("E"); chappe(est, sudNord, est)

def e():
    code("e"); chappe(ouest, sudNord, ouest)

def fm():
    code("F"); chappe(nord, ouestEst, nordEst)

def f():
    code("f"); chappe(nord, ouestEst, nordOuest)

def gm():
    code("G"); chappe(nord, nordOuestSudEst, nord)

def g():
    code("g"); chappe(nord, sudOuestNordEst, nord)

def hm():
    code("H"); chappe(ouest, sudNord, est)

def h():
    code("h"); chappe(est, sudNord, ouest)

def im():
    code("I"); chappe(sud, sudNord, sudEst)

def i():
    code("i"); chappe(sud, sudNord, sudOuest)

def jm():
    code("J"); chappe(sudOuest, ouestEst, sudEst)

def j():
    code("j"); chappe(nordOuest, ouestEst, nordEst)

def km():
    code("K"); chappe(sud, sudNord, est)

def k():
    code("k"); chappe(sud, sudNord, ouest)

def lm():
    code("L"); chappe(est, sudNord, nord)

def l():
    code("l"); chappe(ouest, sudNord, nord)

def mm():
    code("M"); chappe(nord, sudOuestNordEst, sudEst)

def m():
    code("m"); chappe(sudOuest, nordOuestSudEst, nord)

def nm():
    code("N"); chappe(sud, nordOuestSudEst, nordEst)

def n():
    code("n"); chappe(nordOuest, sudOuestNordEst, sud)

def om():
    code("O"); chappe(nord, nordOuestSudEst, est)

def o():
    code("o"); chappe(ouest, sudOuestNordEst, nord)

def pm():
    code("P"); chappe(nordOuest, nordOuestSudEst, sudOuest)

def p():
    code("p"); chappe(sudEst, sudOuestNordEst, nordEst)

def qm():
    code("Q"); chappe(est, sudNord, nordOuest)

def q():
    code("q"); chappe(ouest, sudNord, nordEst)

def rm():
    code("R"); chappe(sud, sudNord, est)

def r():
    code("r"); chappe(sud, sudNord, ouest)

def sm():
    code("S"); chappe(nordEst, nordOuestSudEst, sudOuest)

def s():
    code("s"); chappe(sudEst, sudOuestNordEst, nordOuest)

def tm():
    code("T"); chappe(sudOuest, sudOuestNordEst, sud)

def t():
    code("t"); chappe(sud, nordOuestSudEst, sudEst)

def um():
    code("U"); chappe(sud, nordOuestSudEst, ouest)

def u():
    code("u"); chappe(est, sudOuestNordEst, sud)

def vm():
    code("V"); chappe(sud, ouestEst, sudOuest)

def v():
    code("v"); chappe(sudEst, ouestEst, sud)

def wm():
    code("W"); chappe(sudOuest, nordOuestSudEst, sudOuest)

def w():
    code("w"); chappe(sudEst, sudOuestNordEst, sudEst)

def xm():
    code("X"); chappe(nordOuest, sudOuestNordEst, ouest)

def x():
    code("x"); chappe(est, nordOuestSudEst, nordEst)

def ym():
    code("Y"); chappe(sud, sudOuestNordEst, sud)

def y():
    code("y"); chappe(sud, nordOuestSudEst, sud)

def zm():
    code("Z"); chappe(nordOuest, sudOuestNordEst, nordOuest)

def z():
    code("z"); chappe(nordEst, nordOuestSudEst, nordEst)

# Chiffres
def c0():
    code("0"); chappe(sudEst, ouestEst, nord)

def c1():
    code("1"); chappe(ouest, ouestEst, est)

def c2():
    code("2"); chappe(sud, sudNord, nord)

def c3():
    code("3"); chappe(sud, sudNord, nordEst)

def c4():
    code("4"); chappe(nordEst, ouestEst, nordOuest)

def c5():
    code("5"); chappe(nordEst, ouestEst, sud)

def c6():
    code("6"); chappe(sud, nordOuestSudEst, sudOuest)

def c7():
    code("7"); chappe(sudEst, sudOuestNordEst, sud)

def c8():
    code("8"); chappe(sudEst, ouestEst, sudOuest)

def c9():
    code("9"); chappe(nord, sudOuestNordEst, nordOuest)

# Ponctuation
def point():
    code("."); chappe(sud, sudNord, ouest)

def virgule():
    code(","); chappe(nordOuest, ouestEst, est)

def pointVirgule():
    code(";"); chappe(ouest, ouestEst, nordEst)

def deuxPoints():
    code(":"); chappe(sud, sudNord, est)

def pointDInterrogation():
    code("?"); chappe(sudOuest, ouestEst, nordEst)

def pointDExclamation():
    code("!"); chappe(nordOuest, ouestEst, sudEst)

def parentheseGauche():
    code("("); chappe(ouest, sudNord, nord)

def parentheseDroite():
    code(")"); chappe(est, sudNord, nord)

def blanc():
    code(" "); chappe(nord, nordOuestSudEst, nord)

def aLaLigne():
    lg(tailleGrille); ag()
    translater(0, -9)

policeTexte(geneva); tailleTexte(9); lg(1); eh()
aLaLigne()
am(); a(); bm(); b(); cm(); c(); dm(); d()
em(); e(); fm(); f(); aLaLigne()
gm(); g(); hm(); h(); im(); i(); jm(); j()
km(); k(); lm(); l(); aLaLigne()
mm(); m(); nm(); n(); om(); o(); pm(); p()
qm(); q(); rm(); r(); aLaLigne()
sm(); s(); tm(); t(); um(); u(); vm(); v()
wm(); w(); xm(); x(); aLaLigne()
ym(); y(); zm(); z(); c0(); c1(); c2(); c3()
c4(); c5(); c6(); c7()
aLaLigne()
c8(); c9(); point(); virgule(); pointVirgule()
deuxPoints(); pointDInterrogation()
pointDExclamation()
parentheseGauche(); parentheseDroite(); st()
