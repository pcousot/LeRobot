from LibRobot import *

# Écrire l'alphabet phonétique international
tailleGrille = 3
interligne = 3
espaceEntreMots = 2

# Passer à la ligne s'il n'y a plus la place pour écrire
# un mot de n lettres de l'alphabet dans un rectangle (2
# x 4) espacées de 1 sur la ligne courante.
def aLaLigne(n):
    pe()
    # Essayer de sauter 3 espaces par lettre plus un à la
    # fin du mot de n lettres.
    for i in range(3 * n + 1):
        if not tb():
            translater(1, 0)
    if tb():
        # Passer à la ligne, pas de place sur la ligne
        # courante.
        ag(); translater(0, -(4 + interligne))
    # Revenir en arrière pour écrire sur la ligne
    # courante
    else:
        translater(-(3 * n + 1), 0)

# Écrire les lettres de l'alphabet dans un rectangle (2 x
# 4)
def ecrireA():
    pn(); avf(2); pqtd(); avf(2); avf(-2); pqtg(); av()
    vd(); vd(); avf(3)
    translater(1, 0)

def ecrireB():
    pn(); avf(4); pqtd(); av(); vd(); vd(); av()
    pdt(); av(); vd(); vd(); av()
    translater(3, 0)

def ecrireC():
    translater(2, 1); ps(); vd(); vd(); avf(2); vd()
    vd(); translater(1, -3)

def ecrireD():
    pn(); avf(4); pqtd(); av(); vd(); avf(2); vd()
    av(); translater(3, 0)

def ecrireE():
    pe(); avf(2); avf(-2); pqtg(); avf(2); pqtd(); av()
    pdt(); av()
    pqtd(); avf(2); pqtd(); av(); av()
    translater(1, -4)

def ecrireF():
    pn(); avf(2); pqtd(); av(); pdt(); av(); pqtd()
    avf(2); pqtd(); avf(2)
    translater(1, -4)

def ecrireG():
    translater(1, 2); pe(); av(); pqtd(); av(); vd()
    vd(); avf(2); vd(); vd()
    translater(1, -3)

def ecrireH():
    pn(); avf(2); pqtd(); avf(2); avf(-2); pqtg(); avf(2)
    translater(2, -4)
    avf(4); translater(1, -4)

def ecrireI():
    pe(); avf(2); pdt(); av(); pqtd(); avf(4); pqtg()
    av(); pdt(); avf(2)
    translater(1, -4)

def ecrireJ():
    translater(0, 4); pe(); avf(2); pqtd(); avf(3); vd()
    vd()
    translater(3, -1)

def ecrireK():
    pn(); avf(4); translater(0, -2); pe(); vg(); vd()
    translater(-2, -2)
    vd(); vg(); translater(1, 0)

def ecrireL():
    pn(); avf(4); translater(0, -4); pe(); avf(2)
    translater(1, 0)

def ecrireM():
    pn(); avf(4); pdt(); vg(); vg(); pdt(); avf(4)
    translater(1, 0)

def ecrireN():
    pn(); avf(4); pqtd(); vd(); vg(); pqtg(); avf(2)
    pdt(); avf(4)
    translater(1, 0)

def ecrireO():
    translater(1, 0); pw(); vd(); avf(2); vd(); vd()
    avf(2); vd()
    translater(2, 0)

def ecrireP():
    pn(); avf(4); pqtd(); av(); vd(); vd(); av()
    translater(3, -2); pdt()

def ecrireQ():
    translater(1, 1); ps(); vg(); translater(-1, 0)
    pw(); vd(); avf(2)
    vd(); vd(); avf(2); vd(); translater(2, 0)

def ecrireR():
    pn(); avf(4); pqtd(); av(); vd(); vd(); av()
    pdt(); av(); vd(); av()
    translater(1, 0)

def ecrireS():
    translater(0, 1); ps(); vg(); vg(); vg(); vd()
    vd(); vd(); translater(1, -3)

def ecrireT():
    translater(1, 0); pn(); avf(4); translater(-1, 0)
    pe(); avf(2)
    translater(1, -4)

def ecrireU():
    translater(0, 4); ps(); avf(3); vg(); vg(); avf(3)
    translater(1, -4)

def ecrireV():
    translater(0, 4); ps(); avf(3); pqtg(); vd(); pdt()
    vd(); pqtg(); avf(3)
    translater(1, -4)

def ecrireW():
    translater(0, 4); ps(); avf(4); pqtg(); vg(); avf(2)
    pdt(); avf(2); vg()
    pqtg(); avf(4); translater(1, -4)

def ecrireX():
    pn(); av(); vd(); vg(); av(); translater(-2, 0)
    ps(); av(); vg(); vd(); av()
    translater(1, 0)

def ecrireY():
    translater(0, 4); ps(); av(); vg(); vg(); av()
    pdt(); avf(3); vd(); vd()
    translater(3, -1)

def ecrireZ():
    translater(0, 4); pe(); avf(2); pqtd(); av(); vd()
    vg(); av(); pqtg(); avf(2)
    translater(1, 0)

# Un espace supplémentaire entre chaque mot
def espace():
    translater(espaceEntreMots, 0)

# Code international de l'alphabet par lecture phonétique
# ALFA
def a():
    aLaLigne(4); ecrireA(); ecrireL(); ecrireF()
    ecrireA(); espace()

# BRAVO
def b():
    aLaLigne(5); ecrireB(); ecrireR(); ecrireA()
    ecrireV(); ecrireO(); espace()

# CHARLIE
def c():
    aLaLigne(7); ecrireC(); ecrireH(); ecrireA()
    ecrireR(); ecrireL(); ecrireI()
    ecrireE(); espace()

# DELTA
def d():
    aLaLigne(5); ecrireD(); ecrireE(); ecrireL()
    ecrireT(); ecrireA(); espace()

# ECHO
def e():
    aLaLigne(4); ecrireE(); ecrireC(); ecrireH()
    ecrireO(); espace()

# FOXTROT
def f():
    aLaLigne(7); ecrireF(); ecrireO(); ecrireX()
    ecrireT(); ecrireR(); ecrireO()
    ecrireT(); espace()

# GOLF
def g():
    aLaLigne(4); ecrireG(); ecrireO(); ecrireL()
    ecrireF(); espace()

# HOTEL
def h():
    aLaLigne(5); ecrireH(); ecrireO(); ecrireT()
    ecrireE(); ecrireL(); espace()

# INDIA
def i():
    aLaLigne(5); ecrireI(); ecrireN(); ecrireD()
    ecrireI(); ecrireA(); espace()

# JULIET
def j():
    aLaLigne(6); ecrireJ(); ecrireU(); ecrireL()
    ecrireI(); ecrireE(); ecrireT()
    espace()

# KILO
def k():
    aLaLigne(4); ecrireK(); ecrireI(); ecrireL()
    ecrireO(); espace()

# LIMA
def l():
    aLaLigne(4); ecrireL(); ecrireI(); ecrireM()
    ecrireA(); espace()

# MIKE
def m():
    aLaLigne(4); ecrireM(); ecrireI(); ecrireK()
    ecrireE(); espace()

# NOVEMBER
def n():
    aLaLigne(8); ecrireN(); ecrireO(); ecrireV()
    ecrireE(); ecrireM()
    ecrireB(); ecrireE(); ecrireR(); espace()

# OSCAR
def o():
    aLaLigne(5); ecrireO(); ecrireS(); ecrireC()
    ecrireA(); ecrireR(); espace()

# PAPA
def p():
    aLaLigne(4); ecrireP(); ecrireA(); ecrireP()
    ecrireA(); espace()

# QUEBEC
def q():
    aLaLigne(6); ecrireQ(); ecrireU(); ecrireE()
    ecrireB(); ecrireE(); ecrireC()
    espace()

# ROMEO
def r():
    aLaLigne(5); ecrireR(); ecrireO(); ecrireM()
    ecrireE(); ecrireO(); espace()

# SIERRA
def s():
    aLaLigne(6); ecrireS(); ecrireI(); ecrireE()
    ecrireR(); ecrireR(); ecrireA()
    espace()

# TANGO
def t():
    aLaLigne(5); ecrireT(); ecrireA(); ecrireN()
    ecrireG(); ecrireO(); espace()

# UNIFORM
def u():
    aLaLigne(7); ecrireU(); ecrireN(); ecrireI()
    ecrireF(); ecrireO(); ecrireR()
    ecrireM(); espace()

# VICTOR
def v():
    aLaLigne(6); ecrireV(); ecrireI(); ecrireC()
    ecrireT(); ecrireO(); ecrireR()
    espace()

# WHISKEY
def w():
    aLaLigne(7); ecrireW(); ecrireH(); ecrireI()
    ecrireS(); ecrireK(); ecrireE()
    ecrireY(); espace()

# XRAY
def x():
    aLaLigne(4); ecrireX(); ecrireR(); ecrireA()
    ecrireY(); espace()

# YANKEE
def y():
    aLaLigne(6); ecrireY(); ecrireA(); ecrireN()
    ecrireK(); ecrireE(); ecrireE()
    espace()

# ZULU
def z():
    aLaLigne(4); ecrireZ(); ecrireU(); ecrireL()
    ecrireU(); espace()

lg(tailleGrille); eh(); ag()
translater(0, -(4 + interligne))
a(); b(); c(); d(); e(); f(); g(); h(); i()
j(); k(); l(); m(); n(); o()
p(); q(); r(); s(); t(); u(); v()
w(); x(); y(); z(); st()
