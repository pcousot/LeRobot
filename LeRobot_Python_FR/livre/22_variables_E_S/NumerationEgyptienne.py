from LibRobot import *

# Écrire un nombre en hiéroglyphes égyptiens
g = 12  # Taille de la grille

# Trait vertical
def dixPuissanceZero():
    avf(3); avf(-3)

# Anse
def dixPuissanceUn():
    avf(2); vd(); vd(); avf(2); pdt()

# Spirale
def dixPuissanceDeux():
    x = valLgX()
    lc(); phtd(); avf(2); pqtg(); bc()
    lg(x / 2); vg(); vg(); lg(x); vg(); vg()
    lg(x / 2 * 3); vg(); vg()
    lgX(x / 2 * 3); lgY(x); av()
    phtg(); lc(); lgX(x / 2); av(); pqtg(); bc()
    lg(x)

# Lotus
def dixPuissanceTrois():
    x = valLgX()
    # Bas
    lg(x / 2 * 3); vd(); vd(); pqtd(); avf(2)
    # Tige
    lc(); avf(-1); pqtd(); av(); bc(); lg(x)
    phtg(); av(); avf(-1); pqtd()
    av(); avf(-1); phtg(); lg(x / 2 * 15); av()
    # Fleur
    lgX(x); lgY(x / 2); pqtd(); vg(); phtg()
    av(); pqtd(); av(); phtg(); vg()
    lgX(x / 2 * 3); lgY(x); vg(); vg()
    # Se plaçer à droite du dessin orienté au nord
    lc(); pqtd(); lg(x / 2); avf(18); pqtg(); avf(3)
    pqtg(); bc(); lg(x)

# Index
def dixPuissanceQuatre():
    x = valLgX()
    avf(9); lgY(x * 2); phtg(); av(); avf(-1)
    phtd(); lg(x); avf(-9)

# Têtard
def dixPuissanceCinq():
    x = valLgX()
    # Pattes
    lc(); pqtd(); avf(2); bc(); lgX(x * 3)
    lgY(x * 2); phtg()
    vd(); lgY(x / 2); lgX(x); pqtg(); vg()
    phtd(); vg(); phtd()
    lgY(x / 3 * 2); vd()
    # Ventre
    lc(); p3htd(); av(); pqtd(); bc()
    lgX(x * 3); lgY(x * 2); vd()
    # Tête et oeuil gauche
    pqtg(); lgX(x / 4); avf(-1); lgY(x / 2)
    lgX(x / 4 * 5)
    vd(); phtd(); lg(x * 2); vd(); lc(); p3htd()
    lg(x); av(); bc(); dp()
    # Dos
    lc(); pdt(); av(); bc(); pqtd(); lgY(x / 2)
    lgX(x); vg(); lgX(x / 2 * 7)
    lgY(x * 2); vd()
    # Queue
    phtg(); lgX(x * 3); lgY(x * 2); vg()
    pdt(); lgX(x * 4); lgY(x * 3)
    vd(); p3htg(); lgX(x / 2); lgY(x); vd()
    # Plaçer le robot à droite du dessin orienté au nord
    lc(); pdt(); lgX(x * 5); av(); pqtg(); lg(x)
    bc()

# Un Génie
def tete():
    x = valLgX()
    vg(); vg(); phtd(); lgX(x / 2); vg(); phtg()
    lgX(x / 2 * 3)
    lgY(x * 2); vg()
    # Coiffe
    lc(); lg(x); pqtg(); av(); bc(); phtd()
    lg(x / 2)
    av(); vg(); phtg(); vg(); lc(); phtg(); av()
    bc(); pqtg(); av(); vd()
    phtd(); vd()
    lc(); pqtg(); lgX(x / 2 * 3); lgY(x * 2)
    av(); bc(); lg(x)

def brasDroit():
    x = valLgX()
    lgY(x * 3); av(); lg(x / 2); p3htg(); vg()
    phtg(); vg()
    lc(); pdt(); lgX(x / 2); lgY(x * 3); av()
    bc(); lg(x)

def brasGauche():
    x = valLgX()
    lgY(x * 3); av(); lg(x / 2); p3htd(); vd()
    phtd(); vd()
    lc(); pdt(); lgX(x / 2); lgY(x * 3); av()
    bc(); lg(x)

# Génie du million
def dixPuissanceSix():
    x = valLgX()
    # Cuisse gauche
    lc(); pqtd(); lgX(x / 2); av(); pqtg(); bc()
    lg(x * 2); vd()
    # Côté droit du corps
    phtg(); lgX(x / 2); vg(); phtd(); lgX(x)
    lgY(x * 4); vg(); phtd()
    # Bras droit, tête, bras gauche
    lg(x); brasDroit(); lgX(x / 2 * 7)
    lgY(x * 2); vg(); lg(x)
    brasGauche(); lc(); phtd(); av(); bc(); p3htd()
    tete()
    # Côté gauche du corps
    p3htd(); lgY(x * 3); vg(); lgX(x / 2)
    lgY(x * 3); vg(); phtd()
    lgX(x); lgY(x * 2); vd(); lg(x)
    # Jambe gauche
    p3htg(); lgX(x / 2); av(); avf(-9)
    # Jambe et cuisse droites
    lc(); lgY(x / 2 * 3); lgX(x / 2); phtg()
    av(); bc(); lgX(x / 2)
    lgY(x * 2); pqtg(); av(); pdt()
    lgX(x * 2); lgY(x / 2 * 3); av()
    # Placer le robot à droite du dessin orienté au nord
    lc(); lgX(x * 7 / 2); lgY(x * 2); av()
    lg(x); p3htg(); bc()

# Taille des hiéroglyphes
def largeur(puissanceDeDix):
    if puissanceDeDix == 6:
        return 6
    elif puissanceDeDix == 5:
        return 10
    elif puissanceDeDix == 4:
        return 0
    elif puissanceDeDix == 3:
        return 3
    elif puissanceDeDix == 2:
        return 3
    elif puissanceDeDix == 1:
        return 2
    elif puissanceDeDix == 0:
        return 0
    else:
        return 0

def hauteur(puissanceDeDix):
    if puissanceDeDix == 6:
        return 11
    elif puissanceDeDix == 5:
        return 4
    elif puissanceDeDix == 4:
        return 11
    elif puissanceDeDix == 3:
        return 11
    elif puissanceDeDix == 2:
        return 3
    elif puissanceDeDix == 1:
        return 3
    elif puissanceDeDix == 0:
        return 3
    else:
        return 0

# Disposition des hiéroglyphes
def lignes(chiffre):
    if chiffre == 0:
        return 0
    elif chiffre in (1, 2, 3):
        return 1
    elif chiffre in (4, 5, 6, 7, 8):
        return 2
    elif chiffre == 9:
        return 3
    else:
        return 0

def colonnesLigne1(chiffre):
    if chiffre == 0:
        return 0
    elif chiffre == 1:
        return 1
    elif chiffre in (2, 4, 5):
        return 2
    elif chiffre in (3, 6, 7, 9):
        return 3
    elif chiffre == 8:
        return 4
    else:
        return 0

def colonnesLigne2(chiffre):
    if chiffre in (0, 1, 2, 3):
        return 0
    elif chiffre == 4:
        return 2
    elif chiffre in (5, 6, 9):
        return 3
    elif chiffre in (7, 8):
        return 4
    else:
        return 0

def espaceLignes(puissanceDeDix, chiffre):
    if chiffre == 0:
        return 0
    elif chiffre in (4, 5, 6, 7, 8) and (puissanceDeDix == 3 or puissanceDeDix == 4):
        return 2
    else:
        return 1

def espaceColonnes(puissanceDeDix, chiffre):
    if chiffre < 2 or chiffre > 9:
        return 0
    else:
        if puissanceDeDix in (0, 1, 2, 3, 4, 6):
            return 1
        elif puissanceDeDix == 5:
            return -2
        else:
            return 0

# Taille de la grille dans l'écriture horizontale
def grilleH(puissanceDeDix, chiffre):
    x = valLgX()
    if chiffre in (4, 5, 6, 7, 8) and puissanceDeDix in (3, 4):
        return x / 11 * 5
    elif chiffre == 9 and puissanceDeDix in (3, 4):
        return x / 22 * 7
    elif puissanceDeDix in (0, 1, 2):
        return x / 2
    elif puissanceDeDix == 5:
        return x / 4 * 3
    else:
        return x

# Taille de la grille dans l'écriture verticale
def grilleV(puissanceDeDix):
    if puissanceDeDix in (6, 5, 4, 3):
        return valLgX() / 4 * 3
    else:
        return valLgX() / 2

# Largeur d'une colonne dans la représentation
# hybride
def largeurCoefficient(valeurPrecedente, puissanceDeDix, nombre):
    chiffre = nombre % 10
    v = colonnesLigne1(chiffre) * (largeur(puissanceDeDix) + espaceColonnes(puissanceDeDix, chiffre))
    v = v + largeur(puissanceDeDix) if colonnesLigne1(chiffre) == colonnesLigne2(chiffre) - 1 else v
    valeurPrecedente = max(v, valeurPrecedente)
    if nombre < 10:
        return valeurPrecedente
    else:
        return largeurCoefficient(valeurPrecedente, puissanceDeDix + 1, nombre // 10)

# Déplacer le robot crayon levé de N fois la taille de
# la grille, à droite si N ≥ 0, à gauche sinon
def espacement(n):
    x = valLgX()
    lc()
    if n > 0:
        pqtd(); lg(x * n); av(); pqtg()
    else:
        pqtg(); lg(-(x * n)); av(); pqtd()
    bc(); lg(x)

# Dessiner le hiéroglyphe de la puissance de dix
def hieroglyphe(puissanceDeDix):
    if puissanceDeDix == 6:
        dixPuissanceSix()
    elif puissanceDeDix == 5:
        dixPuissanceCinq()
    elif puissanceDeDix == 4:
        dixPuissanceQuatre()
    elif puissanceDeDix == 3:
        dixPuissanceTrois()
    elif puissanceDeDix == 2:
        dixPuissanceDeux()
    elif puissanceDeDix == 1:
        dixPuissanceUn()
    elif puissanceDeDix == 0:
        dixPuissanceZero()
    else:
        pass

# Écrire le chiffre (multiple de la puissance de dix)
# horizontalement si h est vrai, verticalement sinon
def ecrireChiffreEnHieroglyphes(h, puissanceDeDix, chiffre):
    x = valLgX()
    # Largeur d'un hiéroglyphe et de l'espace qui le
    # suit
    pas = largeur(puissanceDeDix) + espaceColonnes(puissanceDeDix, chiffre)
    espace = espaceColonnes(puissanceDeDix, chiffre)
    if chiffre != 0:
        c = colonnesLigne1(chiffre)
        if h:
            lg(grilleH(puissanceDeDix, chiffre))
            if c == colonnesLigne2(chiffre) - 1:
                espacement(pas / 2)
        else:
            lg(grilleV(puissanceDeDix))
            espacement(-((colonnesLigne1(chiffre) * pas - espace) / 2))
        for j in range(lignes(chiffre)):
            for i in range(c):
                hieroglyphe(puissanceDeDix)
                # Colonne suivante
                espacement(espace)
            # Ligne suivante
            lc()
            avf(hauteur(puissanceDeDix) + espaceLignes(puissanceDeDix, chiffre))
            bc()
            espacement(-(c * pas))
            if c == colonnesLigne2(chiffre) - 1:
                espacement(-(pas / 2))
                c = colonnesLigne2(chiffre)
        # Se placer pour tracer le chiffre suivant
        if h:
            espacement(c * pas - espace)
            lc()
            avf(-(lignes(chiffre) * (hauteur(puissanceDeDix) + espaceLignes(puissanceDeDix, chiffre))))
            bc()
            espacement(2)
            if 1 <= puissanceDeDix and puissanceDeDix <= 4:
                espacement(1)
        else:
            espacement((c * pas - espace) / 2)
        lg(x)

def plusFortePuissance(c):
    if c < 10:
        return 0
    else:
        return 1 + plusFortePuissance(c // 10)

def dixPuissance(n):
    if n == 0:
        return 1
    else:
        return dixPuissance(n - 1) * 10

def ecrireNombreEnHieroglyphes(h, p, c):
    if c < 10:
        ecrireChiffreEnHieroglyphes(h, p, c)
    elif h:
        ecrireNombreEnHieroglyphes(h, p + 1, c // 10)
        ecrireChiffreEnHieroglyphes(h, p, c % 10)
    else:
        ecrireChiffreEnHieroglyphes(h, p, c % 10)
        ecrireNombreEnHieroglyphes(h, p + 1, c // 10)

# Lire un entier n strictement positif dans la fenêtre
# du robot, chiffre par chiffre (en terminant par un
# blanc ou par Entrée, et en corrigeant avec la touche
# d'effacement)
def lireNombre():
    incitation = "Nombre à coder : "
    caracteresDeFin = [" ", "\r", chr(3)]
    effacement = chr(8)
    n = 0; m = ""
    def afficher():
        message(incitation + m)
    # Lire le prochain caractère correct
    def lireC():
        nonlocal m, n
        c = lireCar()
        if m == "" and not ("1" <= c and c <= "9"):
            # Le premier caractère est un chiffre non nul
            bip(); return lireC()
        elif c == effacement:
            # Effacer le dernier chiffre lu
            n = n // 10
            m = m[:len(m) - 1]
            afficher(); return lireC()
        elif "0" <= c and c <= "9" or c in caracteresDeFin:
            return c
        else:
            bip(); return lireC()
    # Lire les chiffres jusqu'à un caractère de fin
    def lireChiffres():
        nonlocal m, n
        c = lireC()
        if "0" <= c and c <= "9":
            d = ord(c) - ord("0")
            if n <= (maxLongint - d) // 10:
                n = 10 * n + d
                m += c
                afficher(); lireChiffres()
            elif n == maxLongint:
                # Fin par débordement supérieur
                bip()
            # Débordement : lire un autre caractère
            else:
                bip(); lireChiffres()
    afficher()
    lireChiffres()
    return n

horizontalement = True

nombre = lireNombre()
if nombre >= 1000000000:
    cacherRobot(); ce()
    ecrire("Trop grand pour les hiéroglyphes égyptiens.")
    writeln("Trop grand pour les hiéroglyphes.")
# Initialisation
else:
    cacherRobot(); lg(g); ag(); lc(); avf(10); bc()
    espacement(2)
    # Représentation classique
    if nombre < 2000000:
        ecrireNombreEnHieroglyphes(horizontalement, 0, nombre)
    # Représentation hybride et grands nombres
    if nombre >= 2000:
        # La ligne du reste descend sous le point de
        # départ : on part 6 pas au-dessus du bord du
        # bas
        ag(); eb(); translater(0, 6); espacement(2)
        # Puissance p de la colonne (génie, têtard, index
        # ou lotus) à multiplier
        pf = plusFortePuissance(nombre)
        p = pf if pf == 3 else pf - 1 if pf == 4 else pf - 2
        coefficient = nombre // dixPuissance(p)
        l = largeurCoefficient(largeur(p), 0, coefficient)
        espacement(l / 2)
        ecrireNombreEnHieroglyphes(not horizontalement, 0, coefficient)
        ecrireChiffreEnHieroglyphes(not horizontalement, p, 1)
        eb(); translater(0, 6)
        espacement(l / 2 + 1)
        # Ligne du reste du nombre
        ecrireNombreEnHieroglyphes(horizontalement, 0, nombre % dixPuissance(p))
st()
