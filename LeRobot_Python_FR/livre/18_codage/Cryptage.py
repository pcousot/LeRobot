from LibRobot import *

# Coder un message avec un code secret
tailleGrille = 6

# Mise en page
def aLaLigne():
    ag(); translater(0, -4)

def finDeMot():
    translater(2, 0)

# Dessin des lettres et des chiffres
def lettreA():
    pn(); translater(2, 0); avf(2); translater(0, -1)
    vg(); vg(); vg(); vg()
    translater(1, -1)

def lettreB():
    pn(); avf(3); translater(0, -2); vd(); vd(); vd()
    vd(); translater(3, -1)

def lettreC():
    translater(2, 0); pw(); av(); vd(); vd(); vd()
    translater(1, -1)

def lettreD():
    pn(); translater(2, 0); avf(3); translater(0, -2)
    vg(); vg(); vg(); vg()
    translater(1, -1)

def lettreE():
    translater(2, 0); pw(); av(); vd(); vd(); vd()
    pqtd(); av(); av()
    translater(3, -1)

def lettreF():
    pn(); avf(2); vd(); vd(); translater(-2, -1); pe()
    av(); translater(2, -1)

def lettreG():
    pn(); translater(2, 1); av(); translater(0, -1)
    vg(); vg(); vg(); vg(); pdt()
    av(); vd(); translater(2, 1)

def lettreH():
    pn(); avf(3); translater(0, -2); vd(); vd(); av()
    translater(1, 0)

def lettreI():
    pn(); avf(2); translater(0, 1); dp()
    translater(1, -3)

def lettreJ():
    translater(1, 3); ps(); dp(); translater(0, -1)
    avf(2); vd()
    translater(2, 1)

def lettreK():
    pn(); avf(3); translater(0, -2); pne(); av()
    translater(-1, -1); pse()
    av(); translater(1, 0)

def lettreL():
    pn(); avf(3); translater(1, -3)

def lettreM():
    pn(); avf(2); translater(0, -1); vd(); vd(); av()
    translater(0, 1); pn()
    vd(); vd(); av(); translater(1, 0)

def lettreN():
    pn(); avf(2); translater(0, -1); vd(); vd(); av()
    translater(1, 0)

def lettreO():
    pn(); translater(0, 1); vd(); vd(); vd(); vd()
    translater(3, -1)

def lettreP():
    translater(0, -1); pn(); avf(3); translater(0, -1)
    vd(); vd(); vd(); vd()
    translater(3, -1)

def lettreQ():
    translater(2, -1); pn(); avf(3); translater(0, -1)
    vg(); vg(); vg(); vg()
    translater(1, -1)

def lettreR():
    pn(); avf(2); translater(0, -1); vd(); vd()
    translater(1, -1)

def lettreS():
    pe(); av(); phtg(); vg(); pw(); av(); pnw()
    vd(); phtd(); av()
    translater(1, -2)

def lettreT():
    translater(0, 3); ps(); av(); pe(); av()
    translater(-1, 0); ps(); av(); vg()
    vg(); translater(1, -1)

def lettreU():
    translater(0, 2); ps(); av(); vg(); vg()
    translater(0, -1); avf(2)
    translater(1, -2)

def lettreV():
    translater(1, 0); pnw(); av(); pn(); av()
    translater(1, -2); pne(); av(); pn()
    av(); translater(1, -2)

def lettreW():
    translater(1, 0); pnw(); av(); pn(); av()
    translater(1, -2); pne(); av(); pn()
    av(); translater(0, -1); pse(); av(); pne(); av()
    pn(); av(); translater(1, -2)

def lettreX():
    pne(); avf(2); translater(0, -2); pnw(); avf(2)
    translater(3, -2)

def lettreY():
    translater(0, 2); ps(); av(); vg(); vg(); av()
    pdt(); avf(2); vd()
    translater(2, 1)

def lettreZ():
    translater(0, 2); pe(); avf(2); psw(); avf(2); pe()
    avf(2)
    translater(1, 0)

def chiffre0():
    translater(1, 0); pw(); vd(); av(); vd(); vd()
    av(); vd(); translater(2, 0)

def chiffre1():
    translater(1, 0); pn(); avf(3); psw(); av()
    translater(2, -2)

def chiffre2():
    translater(0, 2); pn(); vd(); vd(); psw(); avf(2)
    pe(); avf(2)
    translater(1, 0)

def chiffre3():
    translater(0, 3); pne(); vd(); vd(); pw(); av()
    translater(1, 0); pe(); vd()
    vd(); av(); translater(3, 0)

def chiffre4():
    translater(2, 0); pn(); avf(3); psw(); avf(2); pe()
    avf(2)
    translater(1, -1)

def chiffre5():
    pe(); av(); vg(); vg(); av(); pqtd(); av()
    pqtd(); av(); av()
    translater(1, -3)

def chiffre6():
    translater(0, 1); pn(); vd(); vd(); vd(); vd()
    av(); vd(); av()
    translater(1, -1)

def chiffre7():
    translater(0, 3); pe(); avf(2); ps(); av(); psw()
    av(); ps(); av()
    translater(2, 0)

def chiffre8():
    translater(1, 0); pw(); vd(); vd(); av(); vd()
    vd(); av(); translater(0, 2)
    pnw(); vd(); vd(); vd(); translater(2, -2)

def chiffre9():
    translater(2, 2); ps(); vd(); vd(); vd(); vd()
    av(); vd(); av()
    translater(3, 0)

# codage
def blanc():
    chiffre8()

def a():
    finDeMot()

def b():
    chiffre6()

def c():
    lettreH()

def d():
    lettreE()

def e():
    chiffre1()

def f():
    lettreL()

def g():
    lettreN()

def h():
    lettreO()

def i():
    lettreQ()

def j():
    lettreV()

def k():
    chiffre3()

def l():
    lettreY()

def m():
    chiffre9()

def n():
    lettreA()

def o():
    lettreW()

def p():
    lettreK()

def q():
    lettreP()

def r():
    lettreZ()

def s():
    chiffre5()

def t():
    lettreU()

def u():
    lettreF()

def v():
    lettreB()

def w():
    chiffre4()

def x():
    lettreI()

def y():
    lettreM()

def z():
    chiffre7()

def c0():
    lettreJ()

def c1():
    lettreG()

def c2():
    lettreT()

def c3():
    lettreR()

def c4():
    lettreC()

def c5():
    chiffre0()

def c6():
    lettreX()

def c7():
    lettreS()

def c8():
    chiffre2()

def c9():
    lettreD()

eh(); aLaLigne(); lg(tailleGrille)
m(); e(); s(); s(); a(); g(); e(); blanc()
t()
r(); e(); s(); blanc(); s()
e(); c(); r(); e(); t(); blanc(); st()
