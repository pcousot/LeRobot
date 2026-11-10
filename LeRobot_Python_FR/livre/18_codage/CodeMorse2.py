from LibRobot import *

# Écrire et faire entendre des signes en code Morse,
# avec retour automatique à la ligne

# Passer au début de la ligne suivante.
def aLaLigne():
    lc(); ag(); ps(); av(); pe(); av(); bc()

# Tester s'il est possible d'avancer n fois sans toucher
# le bord.
def testAvancer(n):
    # Essayer d'avancer (n - 1) fois sans toucher le
    # bord
    lc()
    for i in range(n - 1):
        if not tb():
            av()
    if tb():
        # Oui, le n-ième av () sort du cadre :
        # passer au début de la ligne suivante.
        aLaLigne()
    # Non, revenir au point de départ dans la ligne
    # courante.
    else:
        avf(-(n - 1))
    bc()

# Point
def pt():
    testAvancer(1); dp(); bip(); lc(); av(); bc()
    delai(0.2)

# Blanc
def bl():
    testAvancer(1); lc(); av(); bc(); delai(0.2)

# Trait
def tr():
    testAvancer(2); av(); biiip(); lc(); av(); bc()
    delai(0.2)

# Tester qu'un symbole de p points, t traits et b blancs
# tient sur la ligne courante, sinon passer à la
# ligne.
def testFinDeLigne(p, t, b):
    testAvancer(p + 2 * t + b)

# Alphabet
def a():
    testFinDeLigne(1, 1, 1); pt(); tr(); bl()

def b():
    testFinDeLigne(3, 1, 1); tr(); pt(); pt(); pt(); bl()

def c():
    testFinDeLigne(2, 2, 1); tr(); pt(); tr(); pt(); bl()

def d():
    testFinDeLigne(2, 1, 1); tr(); pt(); pt(); bl()

def e():
    testFinDeLigne(1, 0, 1); pt(); bl()

def f():
    testFinDeLigne(3, 1, 1); pt(); pt(); tr(); pt(); bl()

def g():
    testFinDeLigne(1, 2, 1); tr(); tr(); pt(); bl()

def h():
    testFinDeLigne(4, 0, 1); pt(); pt(); pt(); pt(); bl()

def i():
    testFinDeLigne(2, 0, 1); pt(); pt(); bl()

def j():
    testFinDeLigne(1, 3, 1); pt(); tr(); tr(); tr(); bl()

def k():
    testFinDeLigne(1, 2, 1); tr(); pt(); tr(); bl()

def l():
    testFinDeLigne(3, 1, 1); pt(); tr(); pt(); pt(); bl()

def m():
    testFinDeLigne(0, 2, 1); tr(); tr(); bl()

def n():
    testFinDeLigne(1, 1, 1); tr(); pt(); bl()

def o():
    testFinDeLigne(0, 3, 1); tr(); tr(); tr(); bl()

def p():
    testFinDeLigne(2, 2, 1); pt(); tr(); tr(); pt(); bl()

def q():
    testFinDeLigne(3, 1, 1); tr(); tr(); pt(); tr(); bl()

def r():
    testFinDeLigne(2, 1, 1); pt(); tr(); pt(); bl()

def s():
    testFinDeLigne(3, 0, 1); pt(); pt(); pt(); bl()

def t():
    testFinDeLigne(0, 1, 1); tr(); bl()

def u():
    testFinDeLigne(2, 1, 1); pt(); pt(); tr(); bl()

def v():
    testFinDeLigne(3, 1, 1); pt(); pt(); pt(); tr(); bl()

def w():
    testFinDeLigne(1, 2, 1); pt(); tr(); tr(); bl()

def x():
    testFinDeLigne(2, 2, 1); tr(); pt(); pt(); tr(); bl()

def y():
    testFinDeLigne(1, 2, 1); tr(); pt(); tr(); tr(); bl()

def z():
    testFinDeLigne(2, 2, 1); tr(); tr(); pt(); pt(); bl()

# chiffres
def c1():
    testFinDeLigne(1, 4, 1); pt(); tr(); tr(); tr(); tr()
    bl()

def c2():
    testFinDeLigne(2, 3, 1); pt(); pt(); tr(); tr(); tr()
    bl()

def c3():
    testFinDeLigne(2, 3, 1); pt(); pt(); pt(); tr(); tr()
    bl()

def c4():
    testFinDeLigne(4, 1, 1); pt(); pt(); pt(); pt(); tr()
    bl()

def c5():
    testFinDeLigne(5, 0, 1); pt(); pt(); pt(); pt(); pt()
    bl()

def c6():
    testFinDeLigne(4, 1, 1); tr(); pt(); pt(); pt(); pt()
    bl()

def c7():
    testFinDeLigne(3, 2, 1); tr(); tr(); pt(); pt(); pt()
    bl()

def c8():
    testFinDeLigne(2, 3, 1); tr(); tr(); tr(); pt(); pt()
    bl()

def c9():
    testFinDeLigne(1, 4, 1); tr(); tr(); tr(); tr(); pt()
    bl()

def c0():
    testFinDeLigne(5, 0, 1); tr(); tr(); tr(); tr(); tr()
    bl()

# Point
def point():
    testFinDeLigne(6, 0, 1); pt(); pt(); pt(); pt(); pt()
    pt(); bl()

# Virgule
def virgule():
    testFinDeLigne(3, 3, 1); pt(); tr(); pt(); tr(); pt()
    tr(); bl()

# Point-virgule
def pointVirgule():
    testFinDeLigne(3, 3, 1); tr(); tr(); tr(); pt(); pt()
    pt(); bl()

# Deux-points
def deuxPoints():
    testFinDeLigne(3, 3, 1); tr(); pt(); tr(); pt(); tr()
    pt(); bl()

# Point d'interrogation
def pointDInterrogation():
    testFinDeLigne(4, 2, 1); pt(); pt(); tr(); tr(); pt()
    pt(); bl()

# Point d'exclamation
def pointDExclamation():
    testFinDeLigne(2, 4, 1); tr(); tr(); pt(); pt(); tr()
    tr(); bl()

# Trait d'union
def traitDUnion():
    testFinDeLigne(4, 5, 1); tr(); pt(); pt(); pt(); pt()
    tr(); bl()

# Apostrophe
def apostrophe():
    testFinDeLigne(0, 4, 1); tr(); tr(); tr(); tr(); bl()

# Barre de division
def barreDeDivision():
    testFinDeLigne(0, 6, 1); tr(); tr(); tr(); tr(); tr()
    tr(); bl()

# Fin de mot
def finDeMot():
    testFinDeLigne(0, 0, 1); lc(); av(); bc(); delai(0.6)

def erreur():
    testFinDeLigne(11, 0, 1); pt(); pt(); pt(); pt()
    pt(); pt(); pt(); pt(); pt()
    pt(); pt(); bl()

def débutTransmission():
    testFinDeLigne(4, 3, 1); tr(); pt(); tr(); pt(); tr()
    pt(); tr(); bl()

def finTransmission():
    testFinDeLigne(4, 3, 1); pt(); tr(); pt(); tr(); pt()
    tr(); pt(); bl()

ec(2); eh(); aLaLigne()
débutTransmission()
a(); b(); c(); d(); e(); f(); g(); h(); i()
j(); k(); l(); m(); n(); o()
p(); q(); r(); s(); t(); u(); v(); w(); x()
y(); z()
c1(); c2(); c3(); c4(); c5(); c6(); c7(); c8()
c9(); c0()
point(); virgule(); pointVirgule(); deuxPoints()
pointDInterrogation(); pointDExclamation()
traitDUnion(); apostrophe()
barreDeDivision(); erreur()
finTransmission()
st()
