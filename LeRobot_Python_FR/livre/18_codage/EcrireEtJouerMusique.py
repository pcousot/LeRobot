from LibRobot import *

# Écrire les notes sur une portée en les jouant

# Taille de la grille
x = 4
y = 3

def dessinerRonde():
    pn(); vd(); vd(); vd(); vd()

def dessinerBlanche():
    pn(); vd(); vd(); vd(); vd()

def dessinerNoire():
    pn(); vd(); vd(); vd(); vd(); vd(); pqtg()
    peindre(); pqtd(); vd(); vd()
    pqtg()
    peindre(); pqtd(); vd()

def queueVersLeHaut():
    translater(2, 0); avf(6); translater(-2, -6)

def queueVersLeBas():
    avf(-6); translater(0, 6)

def cle():
    ec(2); lgX(x); lgY(y)
    translater(2, 4); pn()
    lg(2 * y)
    vd(); vd(); lgX(3 * y); vd()
    lgY(4 * y); vd()
    phtd(); lg(4 * y)
    av(); phtd(); lgX(2 * y)
    lgY(3 * y); vg()
    lgX(y); vg(); vg()
    lgY(y); avf(14); lg(2 * y)
    vd()
    lgX(x / 3); lgY(y / 3)
    vd(); vd(); vd(); vd(); pqtd()
    lgX(x); lgY(y)
    translater(2, 3)
    ec(1)

def portee():
    cf(blanc); lgX(4 * x)
    lgY(y); cacherRobot()
    ag(); pe()
    for ligne in range(5):
        while not tb():
            av()
        pdt(); translater(0, -2)
    # Placer le robot sur la ligne du do du milieu du
    # clavier du piano
    ag(); lgX(x); cle()

# Tracer un barre verticale
def barre():
    translater(4, 2); pn(); avf(8); translater(-3, -10)

# Remonter de la position courante de la note à la
# position du do du milieu du piano en traçant des lignes
# supplémentaires.
def remonter(n):
    pe()
    if n % 2 == 1:
        # Ne pas couper la note re, fa, ... par une ligne
        translater(0, 1)
    for i in range(n // 2 + 1):
        translater(-1, 0); avf(4)
        translater(-3, 2)
    translater(0, -2)

# Redescendre de la position courante de la note à la
# position du do du milieu du piano en traçant des lignes
# supplémentaires.
def redescendre(n):
    pe()
    if n == 0:
        # do du milieu du clavier du piano
        translater(-1, 0); avf(4); translater(-3, 0)
    elif n <= 11:
        # note sur la portee
        translater(0, -n)
    else:
        if n % 2 == 1:
            # Ne pas couper la note re, fa, ... par une
            # ligne
            translater(0, -1)
        for i in range(n // 2 - 1):
            translater(-1, 0); avf(4)
            translater(-3, -2)
        translater(0, -2)

def jouer(nomNote, n, oc, f):
    message(nomNote + " = " + str(n) + ", numéro d'octave = " + str(oc) + ", octave = 12, code = ((" + str(oc) + " * octave) + " + nomNote + ") = " + str(n + oc * octave))
    # Passer à la note suivante
    translater(5, 0)
    # Placer le robot sur la bonne ligne
    if n == d0:
        translater(0, oc * 7)
    elif n == re:
        translater(0, oc * 7 + 1)
    elif n == mi:
        translater(0, oc * 7 + 2)
    elif n == fa:
        translater(0, oc * 7 + 3)
    elif n == sol:
        translater(0, oc * 7 + 4)
    elif n == la:
        translater(0, oc * 7 + 5)
    elif n == si:
        translater(0, oc * 7 + 6)
    # Dessiner la note
    if f == ronde:
        dessinerRonde()
    elif f == blanche:
        dessinerBlanche()
    else:
        dessinerNoire()
    # Dessiner la queue de la note
    if f == blanche or f == noire:
        if oc * octave + n < si:
            queueVersLeHaut()
        else:
            queueVersLeBas()
    # Revenir sur la ligne du do du milieu du clavier du
    # piano.
    if n == d0:
        if oc >= 0:
            redescendre(oc * 7)
        else:
            remonter(-(oc * 7))
    elif n == re:
        if oc >= 0:
            redescendre(oc * 7 + 1)
        else:
            remonter(-(oc * 7 + 1))
    elif n == mi:
        if oc >= 0:
            redescendre(oc * 7 + 2)
        else:
            remonter(-(oc * 7 + 2))
    elif n == fa:
        if oc >= 0:
            redescendre(oc * 7 + 3)
        else:
            remonter(-(oc * 7 + 3))
    elif n == sol:
        if oc >= 0:
            redescendre(oc * 7 + 4)
        else:
            remonter(-(oc * 7 + 4))
    elif n == la:
        if oc >= 0:
            redescendre(oc * 7 + 5)
        else:
            remonter(-(oc * 7 + 5))
    elif n == si:
        if oc >= 0:
            redescendre(oc * 7 + 6)
        else:
            remonter(-(oc * 7 + 6))
    # Jouer la note
    note(oc * octave + n, f)

metronome(140); nuance(forte)
portee()
jouer("do", d0, -3, noire)
jouer("re", re, -3, noire)
jouer("mi", mi, -3, noire)
jouer("fa", fa, -3, noire)
jouer("sol", sol, -3, noire)
jouer("la", la, -3, noire)
jouer("si", si, -3, noire)
barre()
jouer("do", d0, -2, noire)
jouer("re", re, -2, noire)
jouer("mi", mi, -2, noire)
jouer("fa", fa, -2, noire)
jouer("sol", sol, -2, noire)
jouer("la", la, -2, noire)
jouer("si", si, -2, noire)
barre()
jouer("do", d0, -1, noire)
jouer("re", re, -1, noire)
jouer("mi", mi, -1, noire)
jouer("fa", fa, -1, noire)
jouer("sol", sol, -1, noire)
jouer("la", la, -1, noire)
jouer("si", si, -1, noire)
barre(); marquerUnePause()
effacerMessage(); portee()
jouer("do", d0, 0, noire)
jouer("re", re, 0, noire)
jouer("mi", mi, 0, noire)
jouer("fa", fa, 0, noire)
jouer("sol", sol, 0, noire)
jouer("la", la, 0, noire)
jouer("si", si, 0, noire)
barre()
jouer("do", d0, 1, noire)
jouer("re", re, 1, noire)
jouer("mi", mi, 1, noire)
jouer("fa", fa, 1, noire)
jouer("sol", sol, 1, noire)
jouer("la", la, 1, noire)
jouer("si", si, 1, noire)
barre()
jouer("do", d0, 2, noire)
jouer("re", re, 2, noire)
jouer("mi", mi, 2, noire)
jouer("fa", fa, 2, noire)
jouer("sol", sol, 2, noire)
jouer("la", la, 2, noire)
jouer("si", si, 2, noire)
barre(); marquerUnePause()
effacerMessage(); portee()
jouer("do", d0, 3, noire)
jouer("re", re, 3, noire)
jouer("mi", mi, 3, noire)
jouer("fa", fa, 3, noire)
jouer("sol", sol, 3, noire)
jouer("la", la, 3, noire)
jouer("si", si, 3, noire)
barre()
jouer("do", d0, 4, noire)
jouer("re", re, 4, noire)
jouer("mi", mi, 4, noire)
jouer("fa", fa, 4, noire)
jouer("sol", sol, 4, noire)
jouer("la", la, 4, noire)
jouer("si", si, 4, noire)
barre(); marquerUnePause()
