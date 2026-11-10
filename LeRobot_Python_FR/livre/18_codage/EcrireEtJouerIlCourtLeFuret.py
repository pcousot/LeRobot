from LibRobot import *

# Écrire sur une portée et jouer "Il court, il court,
# le furet"

# Taille de la grille
x = 4
y = 3
# Une note n de l'octave o avec l'altération a est codée
# par o * octave + n + a. Codes des notes :
ut = 0
d0 = 0
re = 2
mi = 4
fa = 5
sol = 7
la = 9
si = 11
octave = 12
# Codes des figures de notes :
ronde = 4
blanche = 2
blanche_pointee = 3
noire = 1

def dessinerRonde():
    pn(); vd(); vd(); vd(); vd()

def dessinerBlanche():
    pn(); vd(); vd(); vd(); vd()

def dessinerNoire():
    pn(); vd(); vd(); vd(); vd(); vd(); pqtg()
    peindre(); pqtd(); vd(); vd()
    pqtg(); peindre(); pqtd(); vd()

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

def jouer(n, oc, f):
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
    if f == ronde:
        note(oc * octave + n, ronde)
    elif f == blanche:
        note(oc * octave + n, blanche)
    else:
        note(oc * octave + n, noire)

def refrain():
    portee()
    message("Il"); jouer(d0, 0, noire)
    message("court,"); jouer(fa, 0, noire)
    message("il"); jouer(sol, 0, noire)
    barre()
    message("court,"); jouer(la, 0, blanche)
    message("le"); jouer(sol, 0, noire)
    message("fu-"); jouer(sol, 0, noire)
    barre()
    message("-ret,"); jouer(re, 0, blanche)
    message("le"); jouer(fa, 0, noire)
    message("fu-"); jouer(mi, 0, noire)
    barre()
    message("-ret"); jouer(re, 0, noire)
    message("du"); jouer(d0, 0, noire)
    message("bois"); jouer(re, 0, noire)
    message("Mes-"); jouer(mi, 0, noire)
    barre()
    message("-dames,"); jouer(fa, 0, noire)
    message(""); marquerUnePause()
    portee()
    message("Il"); jouer(d0, 0, noire)
    message("court,"); jouer(fa, 0, noire)
    message("il"); jouer(sol, 0, noire)
    barre()
    message("court,"); jouer(la, 0, blanche)
    message("le"); jouer(sol, 0, noire)
    message("fu-"); jouer(sol, 0, noire)
    barre()
    message("-ret,"); jouer(re, 0, blanche)
    message("le"); jouer(fa, 0, noire)
    message("fu-"); jouer(mi, 0, noire)
    barre()
    message("-ret"); jouer(re, 0, noire)
    message("du"); jouer(d0, 0, noire)
    message("bois"); jouer(re, 0, noire)
    message("jo-"); jouer(mi, 0, noire)
    barre()
    message("-li."); jouer(fa, 0, noire)
    message(""); marquerUnePause()

metronome(200); nuance(forte)
refrain()
portee()
message("il"); jouer(fa, 0, noire)
message("est"); jouer(mi, 0, noire)
barre()
message("pas-"); jouer(re, 0, noire)
message("-sé"); jouer(d0, 0, noire)
message("par"); jouer(re, 0, noire)
message("i-"); jouer(mi, 0, noire)
barre()
message("-ci,"); jouer(fa, 0, blanche)
message("il"); jouer(fa, 0, noire)
message("re-"); jouer(mi, 0, noire)
barre()
message("-pas-"); jouer(re, 0, noire)
message("-se-"); jouer(d0, 0, noire)
message("-ra"); jouer(re, 0, noire)
message("par"); jouer(mi, 0, noire)
barre()
message("là."); jouer(fa, 0, noire)
message(""); marquerUnePause()
refrain()
message("- Fin -"); marquerUnePause()
