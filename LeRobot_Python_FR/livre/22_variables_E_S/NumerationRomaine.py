from LibRobot import *

# Écrire un nombre en chiffres romains
x = 3  # Taille de la grille

def espacement(n):
    lc(); pqtd(); avf(n); pqtg(); bc()

def un():
    avf(6); avf(-6)
    espacement(2)

def cinq():
    lc(); avf(6); bc(); p3htd(); lgX(x * 2)
    lgY(x * 6)
    av()
    pqtg(); av(); lc(); p3htd(); av(); pdt(); bc()
    lg(x)
    espacement(2)

def dix():
    lgX(x * 4); lgY(x * 6); phtd(); av(); lc()
    p3htg()
    av(); bc()
    p3htg(); av(); lc(); p3htg(); bc(); lg(x)
    espacement(2)

def cinquante():
    avf(6); avf(-6); pqtd(); avf(4)
    pqtg()
    espacement(2)

def cent():
    lc(); lgX(x * 4); lgY(x * 2); phtd(); av()
    bc()
    lgX(x * 2)
    p3htd(); vd(); lgY(x * 3); vd(); vd()
    lgY(x * 2)
    vd(); lc()
    avf(2); pdt(); bc(); lg(x)
    espacement(2)

def cinqCents():
    avf(6); pqtd(); avf(1); lg(x * 3); vd(); vd(); lg(x)
    av()
    lc(); avf(-4); pqtd(); bc()
    espacement(2)

def mille():
    avf(6); lgX(x * 2); lgY(x * 5); p3htd(); av()
    pqtg()
    av()
    lg(x); p3htd(); avf(6); pdt()
    espacement(2)

def surligner(n):
    lc(); avf(8); pqtg(); avf(2); bc(); avf(n - 2)
    avf(2 - n)
    lc(); avf(-2); pqtd(); avf(-8); bc()

def debutFacteurCentMille():
    avf(8); pqtd(); avf(2); avf(-2); pqtg(); avf(-8)
    espacement(2)

def finFacteurCentMille():
    avf(8); pqtg(); avf(2); avf(-2); pqtd(); avf(-8)
    espacement(4)

def ecrireNombreEnRomain(n):
    if n >= 1000:
        mille(); ecrireNombreEnRomain(n - 1000)
    elif n >= 950:
        cinquante(); mille(); ecrireNombreEnRomain(n - 950)
    elif n >= 900:
        cent(); mille(); ecrireNombreEnRomain(n - 900)
    elif n >= 500:
        cinqCents(); ecrireNombreEnRomain(n - 500)
    elif n >= 400:
        cent(); cinqCents(); ecrireNombreEnRomain(n - 400)
    elif n >= 100:
        cent(); ecrireNombreEnRomain(n - 100)
    elif n >= 90:
        dix(); cent(); ecrireNombreEnRomain(n - 90)
    elif n >= 50:
        cinquante(); ecrireNombreEnRomain(n - 50)
    elif n >= 40:
        dix(); cinquante(); ecrireNombreEnRomain(n - 40)
    elif n >= 10:
        dix(); ecrireNombreEnRomain(n - 10)
    elif n >= 9:
        un(); dix()
    elif n >= 5:
        cinq(); ecrireNombreEnRomain(n - 5)
    elif n >= 4:
        un(); cinq()
    elif n >= 1:
        un(); ecrireNombreEnRomain(n - 1)

# Largeur du nombre n écrit en chiffres romains
def largeur(n):
    if n >= 1000:
        return 6 + largeur(n - 1000)
    elif n >= 950:
        return 2 * 6 + largeur(n - 950)
    elif n >= 900:
        return 2 * 6 + largeur(n - 900)
    elif n >= 500:
        return 6 + largeur(n - 500)
    elif n >= 400:
        return 2 * 6 + largeur(n - 400)
    elif n >= 100:
        return 6 + largeur(n - 100)
    elif n >= 90:
        return 2 * 6 + largeur(n - 90)
    elif n >= 50:
        return 6 + largeur(n - 50)
    elif n >= 40:
        return 2 * 6 + largeur(n - 40)
    elif n >= 10:
        return 6 + largeur(n - 10)
    elif n >= 9:
        return 2 + 6
    elif n >= 5:
        return 6 + largeur(n - 5)
    elif n >= 4:
        return 2 + 6
    elif n >= 1:
        return 2 + largeur(n - 1)
    else:
        return 0

def nombreEnRomain(n):
    if n >= 500000000:
        writeln("Trop grand pour les chiffres romains.")
    elif n >= 100000:
        debutFacteurCentMille()
        ecrireNombreEnRomain(n // 100000)
        surligner(largeur(n // 100000))
        finFacteurCentMille()
        nombreEnRomain(n % 100000)
    elif n < 5000:
        ecrireNombreEnRomain(n)
    else:
        ecrireNombreEnRomain(n // 1000)
        surligner(largeur(n // 1000))
        espacement(2)
        ecrireNombreEnRomain(n % 1000)

write("Nombre à coder n = ")
n = lireEntier()
lg(x); ag(); espacement(2)
nombreEnRomain(n)
st()
