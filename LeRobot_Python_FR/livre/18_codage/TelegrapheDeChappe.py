from LibRobot import *

# Envoyer un message avec le télégraphe de Chappe
dureeSignal = 2  # secondes pour voir un signal
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
    chappe(nord, ouestEst, nordEst)

def a():
    chappe(nordOuest, ouestEst, nord)

def bm():
    chappe(sudOuest, sudOuestNordEst, nordOuest)

def b():
    chappe(nordEst, nordOuestSudEst, sudEst)

def cm():
    chappe(sud, ouestEst, sud)

def c():
    chappe(nord, ouestEst, nord)

def dm():
    chappe(nord, sudOuestNordEst, nordEst)

def d():
    chappe(nordOuest, nordOuestSudEst, nord)

def em():
    chappe(est, sudNord, est)

def e():
    chappe(ouest, sudNord, ouest)

def fm():
    chappe(nord, ouestEst, nordEst)

def f():
    chappe(nord, ouestEst, nordOuest)

def gm():
    chappe(nord, nordOuestSudEst, nord)

def g():
    chappe(nord, sudOuestNordEst, nord)

def hm():
    chappe(ouest, sudNord, est)

def h():
    chappe(est, sudNord, ouest)

def im():
    chappe(sud, sudNord, sudEst)

def i():
    chappe(sud, sudNord, sudOuest)

def jm():
    chappe(sudOuest, ouestEst, sudEst)

def j():
    chappe(nordOuest, ouestEst, nordEst)

def km():
    chappe(sud, sudNord, est)

def k():
    chappe(sud, sudNord, ouest)

def lm():
    chappe(est, sudNord, nord)

def l():
    chappe(ouest, sudNord, nord)

def mm():
    chappe(nord, sudOuestNordEst, sudEst)

def m():
    chappe(sudOuest, nordOuestSudEst, nord)

def nm():
    chappe(sud, nordOuestSudEst, nordEst)

def n():
    chappe(nordOuest, sudOuestNordEst, sud)

def om():
    chappe(nord, nordOuestSudEst, est)

def o():
    chappe(ouest, sudOuestNordEst, nord)

def pm():
    chappe(nordOuest, nordOuestSudEst, sudOuest)

def p():
    chappe(sudEst, sudOuestNordEst, nordEst)

def qm():
    chappe(est, sudNord, nordOuest)

def q():
    chappe(ouest, sudNord, nordEst)

def rm():
    chappe(sud, sudNord, est)

def r():
    chappe(sud, sudNord, ouest)

def sm():
    chappe(nordEst, nordOuestSudEst, sudOuest)

def s():
    chappe(sudEst, sudOuestNordEst, nordOuest)

def tm():
    chappe(sudOuest, sudOuestNordEst, sud)

def t():
    chappe(sud, nordOuestSudEst, sudEst)

def um():
    chappe(sud, nordOuestSudEst, ouest)

def u():
    chappe(est, sudOuestNordEst, sud)

def vm():
    chappe(sud, ouestEst, sudOuest)

def v():
    chappe(sudEst, ouestEst, sud)

def wm():
    chappe(sudOuest, nordOuestSudEst, sudOuest)

def w():
    chappe(sudEst, sudOuestNordEst, sudEst)

def xm():
    chappe(nordOuest, sudOuestNordEst, ouest)

def x():
    chappe(est, nordOuestSudEst, nordEst)

def ym():
    chappe(sud, sudOuestNordEst, sud)

def y():
    chappe(sud, nordOuestSudEst, sud)

def zm():
    chappe(nordOuest, sudOuestNordEst, nordOuest)

def z():
    chappe(nordEst, nordOuestSudEst, nordEst)

# Chiffres
def c0():
    chappe(sudEst, ouestEst, nord)

def c1():
    chappe(ouest, ouestEst, est)

def c2():
    chappe(sud, sudNord, nord)

def c3():
    chappe(sud, sudNord, nordEst)

def c4():
    chappe(nordEst, ouestEst, nordOuest)

def c5():
    chappe(nordEst, ouestEst, sud)

def c6():
    chappe(sud, nordOuestSudEst, sudOuest)

def c7():
    chappe(sudEst, sudOuestNordEst, sud)

def c8():
    chappe(sudEst, ouestEst, sudOuest)

def c9():
    chappe(nord, sudOuestNordEst, nordOuest)

# Ponctuation .
def point():
    chappe(sud, sudNord, ouest)

# ,
def virgule():
    chappe(nordOuest, ouestEst, est)

# ;
def pointVirgule():
    chappe(ouest, ouestEst, nordEst)

# :
def deuxPoints():
    chappe(sud, sudNord, est)

# ?
def pointDInterrogation():
    chappe(sudOuest, ouestEst, nordEst)

# !
def pointDExclamation():
    chappe(nordOuest, ouestEst, sudEst)

# (
def parentheseGauche():
    chappe(ouest, sudNord, nord)

# )
def parentheseDroite():
    chappe(est, sudNord, nord)

# Blanc
def blanc_():
    chappe(nord, nordOuestSudEst, nord)

effacer()
pm(); a(); r(); i(); s(); e(); s(); t(); t()
r(); a(); n(); q(); u(); i()
l(); l(); e(); e(); t(); l(); e(); s(); b()
o(); n(); s()
c(); i(); t(); o(); y(); e(); n(); s(); s()
o(); n(); t(); c(); o(); n()
t(); e(); n(); t(); s(); point()
