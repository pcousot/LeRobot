from LibRobot import *

# Écrire et faire entendre des signes en code Morse

# Passer au début de la ligne suivante
def aLaLigne():
    lc(); ag(); ps(); av(); pe(); av(); bc()

# Point
def pt():
    dp(); bip(); lc(); av(); bc(); delai(0.1)

# Blanc
def bl():
    lc(); av(); bc(); delai(0.1)

# Trait
def tr():
    av(); biiip(); lc(); av(); bc(); delai(0.1)

# Alphabet
def a():
    pt(); tr(); bl()

def b():
    tr(); pt(); pt(); pt(); bl()

def c():
    tr(); pt(); tr(); pt(); bl()

def d():
    tr(); pt(); pt(); bl()

def e():
    pt(); bl()

def f():
    pt(); pt(); tr(); pt(); bl()

def g():
    tr(); tr(); pt(); bl()

def h():
    pt(); pt(); pt(); pt(); bl()

def i():
    pt(); pt(); bl()

def j():
    pt(); tr(); tr(); tr(); bl()

def k():
    tr(); pt(); tr(); bl()

def l():
    pt(); tr(); pt(); pt(); bl()

def m():
    tr(); tr(); bl()

def n():
    tr(); pt(); bl()

def o():
    tr(); tr(); tr(); bl()

def p():
    pt(); tr(); tr(); pt(); bl()

def q():
    tr(); tr(); pt(); tr(); bl()

def r():
    pt(); tr(); pt(); bl()

def s():
    pt(); pt(); pt(); bl()

def t():
    tr(); bl()

def u():
    pt(); pt(); tr(); bl()

def v():
    pt(); pt(); pt(); tr(); bl()

def w():
    pt(); tr(); tr(); bl()

def x():
    tr(); pt(); pt(); tr(); bl()

def y():
    tr(); pt(); tr(); tr(); bl()

def z():
    tr(); tr(); pt(); pt(); bl()

# Chiffres
def c1():
    pt(); tr(); tr(); tr(); tr(); bl()

def c2():
    pt(); pt(); tr(); tr(); tr(); bl()

def c3():
    pt(); pt(); pt(); tr(); tr(); bl()

def c4():
    pt(); pt(); pt(); pt(); tr(); bl()

def c5():
    pt(); pt(); pt(); pt(); pt(); bl()

def c6():
    tr(); pt(); pt(); pt(); pt(); bl()

def c7():
    tr(); tr(); pt(); pt(); pt(); bl()

def c8():
    tr(); tr(); tr(); pt(); pt(); bl()

def c9():
    tr(); tr(); tr(); tr(); pt(); bl()

def c0():
    tr(); tr(); tr(); tr(); tr(); bl()

# Ponctuation
def point():
    pt(); pt(); pt(); pt(); pt(); pt(); bl()

def virgule():
    pt(); tr(); pt(); tr(); pt(); tr(); bl()

def pointVirgule():
    tr(); tr(); tr(); pt(); pt(); pt(); bl()

def deuxPoints():
    tr(); pt(); tr(); pt(); tr(); pt(); bl()

def pointDInterrogation():
    pt(); pt(); tr(); tr(); pt(); pt(); bl()

def pointDExclamation():
    tr(); tr(); pt(); pt(); tr(); tr(); bl()

def traitDUnion():
    tr(); pt(); pt(); pt(); pt(); tr(); bl()

def apostrophe():
    tr(); tr(); tr(); tr(); bl()

def barreDeDivision():
    tr(); tr(); tr(); tr(); tr(); tr(); bl()

# Fin de mot
def finDeMot():
    lc(); av(); bc(); delai(0.6)

def erreur():
    for i in range(11):
        pt()
    bl()

def debutTransmission():
    ec(2); eh(); aLaLigne()
    tr(); pt(); tr(); pt(); tr(); pt(); tr(); bl()

def finTransmission():
    pt(); tr(); pt(); tr(); pt(); tr(); pt(); bl()

debutTransmission()
a(); b(); c(); d(); e(); aLaLigne()
f(); g(); h(); i(); j(); k(); l(); aLaLigne()
m(); n(); o(); p(); q(); r(); s(); aLaLigne()
t(); u(); v(); w(); x(); y(); aLaLigne()
z(); c1(); c2(); c3(); aLaLigne()
c4(); c5(); c6(); c7(); c8(); aLaLigne()
c9(); c0(); point(); virgule(); aLaLigne()
pointVirgule(); deuxPoints(); pointDInterrogation()
pointDExclamation(); aLaLigne()
traitDUnion(); apostrophe(); barreDeDivision()
aLaLigne(); erreur(); finTransmission(); st()
