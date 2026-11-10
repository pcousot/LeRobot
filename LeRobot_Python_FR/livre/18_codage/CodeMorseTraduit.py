from LibRobot import *

# Écrire des signes en code Morse avec leur
# traduction, en les faisant entendre

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
        aLaLigne(); aLaLigne()
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

# Écrire le texte l (complété par un blanc si sa
# longueur est impaire) et avancer après lui
def ecr(l):
    l = l + " " if len(l) % 2 == 1 else l
    testAvancer(len(l) // 2); ecrire(l)
    lc(); avf(len(l) // 2); bc()

# Tester qu'un symbole de p points, t traits, b blancs et
# c caractères tient sur la ligne courante, sinon passer
# à la ligne.
def testFinDeLigne(p, t, b, c):
    if c % 2 == 1:
        testAvancer(p + 2 * t + b + (c + 1) // 2)
    else:
        testAvancer(p + 2 * t + b + c // 2)

# Alphabet
def a():
    testFinDeLigne(1, 1, 1, 3); ecr("A :"); pt(); tr(); bl()

def b():
    testFinDeLigne(3, 1, 1, 3); ecr("B :"); tr(); pt(); pt()
    pt(); bl()

def c():
    testFinDeLigne(2, 2, 1, 3); ecr("C :"); tr(); pt(); tr()
    pt(); bl()

def d():
    testFinDeLigne(1, 2, 1, 3); ecr("D :"); tr(); pt(); pt()
    bl()

def e():
    testFinDeLigne(1, 0, 1, 3); ecr("E :"); pt(); bl()

def f():
    testFinDeLigne(3, 1, 1, 3); ecr("F :"); pt(); pt(); tr()
    pt(); bl()

def g():
    testFinDeLigne(1, 2, 1, 3); ecr("G :"); tr(); tr(); pt()
    bl()

def h():
    testFinDeLigne(4, 0, 1, 3); ecr("H :"); pt(); pt(); pt()
    pt(); bl()

def i():
    testFinDeLigne(2, 0, 1, 3); ecr("I :"); pt(); pt(); bl()

def j():
    testFinDeLigne(1, 3, 1, 3); ecr("J :"); pt(); tr(); tr()
    tr(); bl()

def k():
    testFinDeLigne(1, 2, 1, 3); ecr("K :"); tr(); pt(); tr()
    bl()

def l():
    testFinDeLigne(3, 1, 1, 3); ecr("L :"); pt(); tr(); pt()
    pt(); bl()

def m():
    testFinDeLigne(1, 2, 1, 3); ecr("M :"); tr(); tr(); bl()

def n():
    testFinDeLigne(0, 1, 1, 3); ecr("N :"); tr(); pt(); bl()

def o():
    testFinDeLigne(1, 3, 1, 3); ecr("O :"); tr(); tr(); tr()
    bl()

def p():
    testFinDeLigne(2, 2, 1, 3); ecr("P :"); pt(); tr(); tr()
    pt(); bl()

def q():
    testFinDeLigne(1, 3, 1, 3); ecr("Q :"); tr(); tr(); pt()
    tr(); bl()

def r():
    testFinDeLigne(2, 1, 1, 3); ecr("R :"); pt(); tr(); pt()
    bl()

def s():
    testFinDeLigne(3, 0, 1, 3); ecr("S :"); pt(); pt(); pt()
    bl()

def t():
    testFinDeLigne(0, 1, 1, 3); ecr("T :"); tr(); bl()

def u():
    testFinDeLigne(2, 1, 1, 3); ecr("U :"); pt(); pt(); tr()
    bl()

def v():
    testFinDeLigne(3, 1, 1, 3); ecr("V :"); pt(); pt(); pt()
    tr(); bl()

def w():
    testFinDeLigne(1, 2, 1, 3); ecr("W :"); pt(); tr(); tr()
    bl()

def x():
    testFinDeLigne(2, 2, 1, 3); ecr("X :"); tr(); pt(); pt()
    tr(); bl()

def y():
    testFinDeLigne(1, 3, 1, 3); ecr("Y :"); tr(); pt(); tr()
    tr(); bl()

def z():
    testFinDeLigne(2, 2, 1, 3); ecr("Z :"); tr(); tr(); pt()
    pt(); bl()

# chiffres
def c1():
    testFinDeLigne(1, 4, 1, 3); ecr("1 :"); pt(); tr(); tr()
    tr(); tr(); bl()

def c2():
    testFinDeLigne(2, 3, 1, 3); ecr("2 :"); pt(); pt(); tr()
    tr(); tr(); bl()

def c3():
    testFinDeLigne(3, 2, 1, 3); ecr("3 :"); pt(); pt(); pt()
    tr(); tr(); bl()

def c4():
    testFinDeLigne(4, 1, 1, 3); ecr("4 :"); pt(); pt(); pt()
    pt(); tr(); bl()

def c5():
    testFinDeLigne(5, 0, 1, 3); ecr("5 :"); pt(); pt(); pt()
    pt(); pt(); bl()

def c6():
    testFinDeLigne(4, 1, 1, 3); ecr("6 :"); tr(); pt(); pt()
    pt(); pt(); bl()

def c7():
    testFinDeLigne(3, 2, 1, 3); ecr("7 :"); tr(); tr(); pt()
    pt(); pt(); bl()

def c8():
    testFinDeLigne(2, 3, 1, 3); ecr("8 :"); tr(); tr(); tr()
    pt(); pt(); bl()

def c9():
    testFinDeLigne(1, 4, 1, 3); ecr("9 :"); tr(); tr(); tr()
    tr(); pt(); bl()

def c0():
    testFinDeLigne(0, 5, 1, 3); ecr("0 :"); tr(); tr(); tr()
    tr(); tr(); bl()

# Point
def point():
    testFinDeLigne(6, 0, 1, 3); ecr(". :"); pt(); pt(); pt()
    pt(); pt(); pt(); bl()

# Virgule
def virgule():
    testFinDeLigne(3, 3, 1, 3); ecr(", :"); pt(); tr(); pt()
    tr(); pt(); tr(); bl()

# Point-virgule
def pointVirgule():
    testFinDeLigne(3, 3, 1, 3); ecr("; :"); tr(); tr(); tr()
    pt(); pt(); pt(); bl()

# Deux-points
def deuxPoints():
    testFinDeLigne(3, 3, 1, 3); ecr(": :"); tr(); pt(); tr()
    pt(); tr(); pt(); bl()

# Point d'interrogation
def pointDInterrogation():
    testFinDeLigne(4, 2, 1, 3); ecr("? :"); pt(); pt(); tr()
    tr(); pt(); pt(); bl()

# Point d'exclamation
def pointDExclamation():
    testFinDeLigne(2, 4, 1, 3); ecr("! :"); tr(); tr(); pt()
    pt(); tr(); tr(); bl()

# Trait d'union
def traitDUnion():
    testFinDeLigne(4, 5, 1, 3); ecr("- :"); tr(); pt(); pt()
    pt(); pt(); tr(); bl()

# Apostrophe
def apostrophe():
    testFinDeLigne(0, 4, 1, 3); ecr("' :"); tr(); tr(); tr()
    tr(); bl()

# Barre de division
def barreDeDivision():
    testFinDeLigne(0, 6, 1, 3); ecr("/ :"); tr(); tr(); tr()
    tr(); tr(); tr(); bl()

# Fin de mot
def finDeMot():
    testFinDeLigne(0, 0, 1, 0); lc(); av(); bc(); delai(0.6)

def erreur():
    testFinDeLigne(11, 0, 1, 8); ecr("Erreur :"); pt(); pt()
    pt(); pt(); pt(); pt(); pt()
    pt(); pt(); pt(); pt(); bl()

def débutTransmission():
    testFinDeLigne(4, 3, 1, 23); ecr("Début de transmission :")
    tr(); pt(); tr(); pt(); tr()
    pt(); tr(); bl()

def finTransmission():
    testFinDeLigne(4, 3, 1, 21); ecr("Fin de transmission :")
    pt(); tr(); pt(); tr(); pt()
    tr(); pt(); bl()

ec(2); eh(); lgY(9); aLaLigne()
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
