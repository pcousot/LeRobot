from LibRobot import *

# Envoyer un message avec le télégraphe de Chappe,
# avec sa traduction
dureeSignal = 1.5  # secondes pour voir un signal
longueurBras = 60  # Longueur d'un bras articulé
# Taille de la grille pour un bras en diagonale
diagonale = 42

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

def effacer():
    delai(dureeSignal); cf(blanc); lg(60); ec(6)

def chappeCote(d):
    if d == nord:
        pn(); lg(longueurBras)
    elif d == nordEst:
        pne(); lg(diagonale)
    elif d == est:
        pe(); lg(longueurBras)
    elif d == sudEst:
        pse(); lg(diagonale)
    elif d == sud:
        ps(); lg(longueurBras)
    elif d == sudOuest:
        psw(); lg(diagonale)
    elif d == ouest:
        pw(); lg(longueurBras)
    elif d == nordOuest:
        pnw(); lg(diagonale)
    av()

def chappe(g, m, d):
    if m == sudNord:
        ce(); ps(); lg(longueurBras); av()
        chappeCote(g)
        ce(); pn(); lg(longueurBras); av()
        chappeCote(d)
    elif m == sudOuestNordEst:
        ce(); psw(); lg(diagonale); av()
        chappeCote(g)
        ce(); pne(); lg(diagonale); av()
        chappeCote(d)
    elif m == ouestEst:
        ce(); pw(); lg(longueurBras); av()
        chappeCote(g)
        ce(); pe(); lg(longueurBras); av()
        chappeCote(d)
    elif m == nordOuestSudEst:
        ce()
        pnw(); lg(diagonale); av()
        chappeCote(g)
        ce(); pse(); lg(diagonale); av()
        chappeCote(d)
    ce(); pn()
    effacer()

# Lettres : am () pour A majuscule, a () pour a
# minuscule, etc.
def am():
    message("A"); chappe(nord, ouestEst, nordEst)

def a():
    message("a"); chappe(nordOuest, ouestEst, nord)

def bm():
    message("B"); chappe(sudOuest, sudOuestNordEst, nordOuest)

def b():
    message("b"); chappe(nordEst, nordOuestSudEst, sudEst)

def cm():
    message("C"); chappe(sud, ouestEst, sud)

def c():
    message("c"); chappe(nord, ouestEst, nord)

def dm():
    message("D"); chappe(nord, sudOuestNordEst, nordEst)

def d():
    message("d"); chappe(nordOuest, nordOuestSudEst, nord)

def em():
    message("E"); chappe(est, sudNord, est)

def e():
    message("e"); chappe(ouest, sudNord, ouest)

def fm():
    message("F"); chappe(nord, ouestEst, nordEst)

def f():
    message("f"); chappe(nord, ouestEst, nordOuest)

def gm():
    message("G"); chappe(nord, nordOuestSudEst, nord)

def g():
    message("g"); chappe(nord, sudOuestNordEst, nord)

def hm():
    message("H"); chappe(ouest, sudNord, est)

def h():
    message("h"); chappe(est, sudNord, ouest)

def im():
    message("I"); chappe(sud, sudNord, sudEst)

def i():
    message("i"); chappe(sud, sudNord, sudOuest)

def jm():
    message("J"); chappe(sudOuest, ouestEst, sudEst)

def j():
    message("j"); chappe(nordOuest, ouestEst, nordEst)

def km():
    message("K"); chappe(sud, sudNord, est)

def k():
    message("k"); chappe(sud, sudNord, ouest)

def lm():
    message("L"); chappe(est, sudNord, nord)

def l():
    message("l"); chappe(ouest, sudNord, nord)

def mm():
    message("M"); chappe(nord, sudOuestNordEst, sudEst)

def m():
    message("m"); chappe(sudOuest, nordOuestSudEst, nord)

def nm():
    message("N"); chappe(sud, nordOuestSudEst, nordEst)

def n():
    message("n"); chappe(nordOuest, sudOuestNordEst, sud)

def om():
    message("O"); chappe(nord, nordOuestSudEst, est)

def o():
    message("o"); chappe(ouest, sudOuestNordEst, nord)

def pm():
    message("P"); chappe(nordOuest, nordOuestSudEst, sudOuest)

def p():
    message("p"); chappe(sudEst, sudOuestNordEst, nordEst)

def qm():
    message("Q"); chappe(est, sudNord, nordOuest)

def q():
    message("q"); chappe(ouest, sudNord, nordEst)

def rm():
    message("R"); chappe(sud, sudNord, est)

def r():
    message("r"); chappe(sud, sudNord, ouest)

def sm():
    message("S"); chappe(nordEst, nordOuestSudEst, sudOuest)

def s():
    message("s"); chappe(sudEst, sudOuestNordEst, nordOuest)

def tm():
    message("T"); chappe(sudOuest, sudOuestNordEst, sud)

def t():
    message("t"); chappe(sud, nordOuestSudEst, sudEst)

def um():
    message("U"); chappe(sud, nordOuestSudEst, ouest)

def u():
    message("u"); chappe(est, sudOuestNordEst, sud)

def vm():
    message("V"); chappe(sud, ouestEst, sudOuest)

def v():
    message("v"); chappe(sudEst, ouestEst, sud)

def wm():
    message("W"); chappe(sudOuest, nordOuestSudEst, sudOuest)

def w():
    message("w"); chappe(sudEst, sudOuestNordEst, sudEst)

def xm():
    message("X"); chappe(nordOuest, sudOuestNordEst, ouest)

def x():
    message("x"); chappe(est, nordOuestSudEst, nordEst)

def ym():
    message("Y"); chappe(sud, sudOuestNordEst, sud)

def y():
    message("y"); chappe(sud, nordOuestSudEst, sud)

def zm():
    message("Z"); chappe(nordOuest, sudOuestNordEst, nordOuest)

def z():
    message("z"); chappe(nordEst, nordOuestSudEst, nordEst)

# Chiffres
def c0():
    message("0"); chappe(sudEst, ouestEst, nord)

def c1():
    message("1"); chappe(ouest, ouestEst, est)

def c2():
    message("2"); chappe(sud, sudNord, nord)

def c3():
    message("3"); chappe(sud, sudNord, nordEst)

def c4():
    message("4"); chappe(nordEst, ouestEst, nordOuest)

def c5():
    message("5"); chappe(nordEst, ouestEst, sud)

def c6():
    message("6"); chappe(sud, nordOuestSudEst, sudOuest)

def c7():
    message("7"); chappe(sudEst, sudOuestNordEst, sud)

def c8():
    message("8"); chappe(sudEst, ouestEst, sudOuest)

def c9():
    message("9"); chappe(nord, sudOuestNordEst, nordOuest)

# Ponctuation
def point():
    message("."); chappe(sud, sudNord, ouest)

def virgule():
    message(","); chappe(nordOuest, ouestEst, est)

def pointVirgule():
    message(";"); chappe(ouest, ouestEst, nordEst)

def deuxPoints():
    message(":"); chappe(sud, sudNord, est)

def pointDInterrogation():
    message("?"); chappe(sudOuest, ouestEst, nordEst)

def pointDExclamation():
    message("!"); chappe(nordOuest, ouestEst, sudEst)

def parentheseGauche():
    message("("); chappe(ouest, sudNord, nord)

def parentheseDroite():
    message(")"); chappe(est, sudNord, nord)

def blanc_():
    message("' '"); chappe(nord, nordOuestSudEst, nord)

effacer(); am(); a(); bm(); b(); cm(); c()
dm(); d(); em(); e(); fm(); f()
gm(); g(); hm(); h(); im(); i()
jm(); j(); km(); k(); lm(); l(); mm(); m()
nm(); n(); om(); o(); pm(); p()
qm(); q(); rm(); r(); sm(); s(); tm(); t()
um(); u(); vm(); v(); wm(); w(); xm(); x()
ym(); y(); zm(); z(); c0()
c1(); c2(); c3(); c4(); c5()
c6(); c7(); c8(); c9(); point(); virgule()
pointVirgule(); deuxPoints()
pointDInterrogation(); pointDExclamation()
parentheseGauche(); parentheseDroite()
