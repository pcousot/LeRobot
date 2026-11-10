from LibRobot import *

# Écrire un nombre en numération acrophonique grecque
x = 2  # Taille de la grille
c = 1  # Taille du crayon
talent = 6000
drachme = 6
obole = 1

def espacement():
    lc(); pqtd(); avf(2); pqtg(); bc()

def un():
    ec(c * 2); avf(9); avf(-9); ec(c)

def unDrachme():
    ec(c * 2); avf(9); avf(-4); pqtd(); avf(2); lc()
    pqtg()
    avf(-5); bc(); ec(c)

def unTalent():
    ec(c * 2); lc(); pqtd(); avf(3); pqtg(); bc()
    avf(9); pqtg()
    avf(3); avf(-6); avf(3); pqtd(); avf(-9); lc()
    pqtd()
    avf(3); pqtg(); bc(); ec(c)

def cinq():
    ec(c * 2)
    avf(9); pqtd(); avf(6); pqtd(); avf(4)
    lc(); avf(5); pdt(); bc()
    ec(c)

def cinqTalents():
    ec(c * 2)
    avf(9); pqtd(); avf(6); pqtd(); avf(3); pqtd(); avf(3)
    pqtg(); avf(2); avf(-2); pqtd(); avf(3); lc()
    avf(-6)
    pqtd(); avf(-6); bc(); ec(c)

def dix(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    lgY(valLgY() * 3); phtd(); av(); pqtd(); av()
    p3htd(); avf(2)
    lc(); pdt(); avf(2); pqtg(); bc(); lg(x); ec(c)

def dixTalents(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    lc(); lgY(valLgY() / 3 * 2); av(); bc()
    lgY(valLgY() * 7 / 2); phtd()
    av()
    pqtd(); av(); p3htd(); av(); pqtg()
    lgY(valLgY() * 2 / 7); av(); avf(-1)
    pqtd(); av(); lc(); avf(-2); pqtd(); avf(-1)
    bc(); lg(x); ec(c)

def cinquante():
    lc(); lg(x / 2); avf(11); lg(x); pqtd(); avf(2)
    pqtg()
    bc()
    dix(False)
    lc(); pqtg(); avf(4); pqtg(); lg(x / 2); avf(11)
    lg(x)
    pdt(); bc()
    cinq()

def cinquanteTalents():
    lc(); lg(x / 2); avf(11); lg(x); pqtd(); avf(2)
    pqtg()
    bc()
    dixTalents(False)
    lc(); pqtg(); avf(4); pqtg(); lg(x / 2); avf(11)
    lg(x)
    pdt(); bc()
    cinq()

def cent(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    avf(3); lgY(valLgY() / 2); avf(-3); pqtd(); avf(2)
    pqtg()
    avf(3); avf(-6); lg(x); ec(c)

def centTalents(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    avf(3); lgY(valLgY() / 2); avf(-3); pqtd(); av()
    pqtd()
    lgY(valLgY() * 4 / 3); av(); avf(-1); pqtg()
    av(); pqtg()
    lgY(valLgY() * 3 / 4); avf(3); avf(-6); lg(x); ec(c)

def cinqCents():
    lc(); avf(5); pqtd(); avf(4); pqtg(); bc()
    cent(False)
    lc(); pqtg(); avf(6); pqtg(); avf(5); pdt(); bc()
    cinq()

def cinqCentsTalents():
    lc(); avf(5); pqtd(); avf(4); pqtg(); bc()
    centTalents(False)
    lc(); pqtg(); avf(6); pqtg(); avf(5); pdt(); bc()
    cinq()

def mille(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    lgX(valLgX() * 2); lgY(valLgY() * 3); phtd()
    av()
    lc(); p3htg(); av(); p3htg(); bc(); av()
    p3htg(); lg(x); ec(c)

def milleTalents(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    lgY(valLgY() / 3 * 2); lc(); pqtd(); av()
    pqtg(); bc(); av(); pqtd()
    av(); avf(-2); phtg(); lgX(valLgX() * 2)
    lgY(valLgY() * 7 / 2)
    av(); lc(); p3htg(); av(); p3htg(); bc(); av()
    p3htg()
    lgY(valLgY() * 2 / 7)
    lc(); avf(-1); bc(); lg(x); ec(c)

def cinqMille():
    lc(); lg(x / 2); avf(11); lg(x); pqtd(); avf(2)
    pqtg()
    bc()
    mille(False)
    lc(); pqtg(); avf(4); pqtg(); lg(x / 2); avf(11)
    lg(x)
    pdt(); bc()
    cinq()

def cinqMilleTalents():
    lc(); lg(x / 2); avf(11); lg(x); pqtd(); avf(2)
    pqtg()
    bc()
    milleTalents(False)
    lc(); pqtg(); avf(4); pqtg(); lg(x / 2); avf(11)
    lg(x)
    pdt(); bc()
    cinq()

def dixMille(grandeTaille):
    if grandeTaille:
        lg(x * 3); ec(c * 2)
    avf(3); lgY(valLgY() * 2); p3htd(); av(); pqtg()
    av()
    lgY(valLgY() / 2); p3htd(); avf(3); pdt()
    lg(x); ec(c)

def cinquanteMille():
    lc(); lg(x / 2); avf(11); lg(x); pqtd(); avf(2)
    pqtg()
    bc()
    dixMille(False)
    lc(); pqtg(); avf(4); pqtg(); lg(x / 2); avf(11)
    lg(x)
    pdt(); bc()
    cinq()

def ecrireChiffre(grandNombre, unite, puissanceDeDix, chiffre):
    if unite == talent:
        for i in range(chiffre // 5):
            if puissanceDeDix == 0:
                cinqTalents()
            elif puissanceDeDix == 1:
                cinquanteTalents()
            elif puissanceDeDix == 2:
                cinqCentsTalents()
            elif puissanceDeDix == 3:
                cinqMilleTalents()
            else:
                pass
            espacement()
        for i in range(chiffre % 5):
            if puissanceDeDix == 0:
                unTalent()
            elif puissanceDeDix == 1:
                dixTalents(True)
            elif puissanceDeDix == 2:
                centTalents(True)
            elif puissanceDeDix == 3:
                milleTalents(True)
            else:
                pass
            espacement()
    elif unite == drachme:
        for i in range(chiffre // 5):
            if puissanceDeDix == 0:
                cinq()
            elif puissanceDeDix == 1:
                cinquante()
            elif puissanceDeDix == 2:
                cinqCents()
            elif puissanceDeDix == 3:
                cinqMille()
            elif puissanceDeDix == 4:
                cinquanteMille()
            else:
                pass
            espacement()
        for i in range(chiffre % 5):
            if puissanceDeDix == 0:
                if grandNombre:
                    unDrachme()
                else:
                    un()
            elif puissanceDeDix == 1:
                dix(True)
            elif puissanceDeDix == 2:
                cent(True)
            elif puissanceDeDix == 3:
                mille(True)
            elif puissanceDeDix == 4:
                dixMille(True)
            else:
                pass
            espacement()
    elif unite == obole:
        for i in range(chiffre):
            un()
            espacement()

def ecrireNombre(b, u, p, c):
    if c < 10:
        ecrireChiffre(b, u, p, c)
    else:
        ecrireNombre(b, u, p + 1, c // 10)
        ecrireChiffre(b, u, p, c % 10)

def ecrireNombreEnGrec(c):
    grandNombre = True
    if c >= 100000:
        ecrireNombre(grandNombre, talent, 0, c // 6 // 6000)
        ecrireNombre(grandNombre, drachme, 0, c // 6 % 6000)
        ecrireNombre(grandNombre, obole, 0, c % 6)
    else:
        ecrireNombre(not grandNombre, drachme, 0, c)

write("Nombre à coder n = ")
n = lireEntier()
ec(c); lg(x); ag()
ecrireNombreEnGrec(n)
st()
