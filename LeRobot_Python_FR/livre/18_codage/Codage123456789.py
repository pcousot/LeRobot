from LibRobot import *

# Coder 123 456 789 dans diverses numérations
def numerationBabylonienne(nombreACoder):
    x = 6  # Taille de la grille
    # Tête de clou
    def teteDeClou():
        lc(); pqtd(); av(); pqtg(); bc()
        lgY(valLgY() * 2); vg(); avf(-2); vg()
        lc(); pqtg(); av(); pqtg(); bc()
        lg(x)

    # Clou dont la pointe est de hauteur n
    def un(n):
        lc(); pqtd(); av(); pqtg(); bc()
        avf(n); lc(); pqtg(); av(); pqtd()
        teteDeClou(); lc(); avf(-n); bc()

    # Chevron
    def dix():
        lc(); av(); pqtd(); bc()
        lgX(x * 2); vd(); p3htd()
        lgX(x)
        lgY(x * 2); vd(); p3htd()
        lgY(x)
        lgX(x * 2); vd()
        lc(); p3htg(); av(); p3htg(); bc()
        lg(x)

    # Laisser n blancs horizontalement partant d'une et
    # revenant à une orientation nord du robot
    def espacement(n):
        lc(); pqtd(); avf(n); pqtg(); bc()

    def dizainesDesUnitesSexagesimales(chiffreDesDizaines):
        if chiffreDesDizaines == 1:
            dix()
        elif chiffreDesDizaines == 2:
            dix(); dix()
        elif chiffreDesDizaines == 3:
            dix(); dix(); dix()
        elif chiffreDesDizaines == 4:
            lc(); pqtd(); avf(2); pqtg(); bc()
            dix()
            lc(); avf(2); pqtg(); avf(4); pqtd(); bc()
            dix(); dix(); dix()
            lc(); avf(-2); bc()
        elif chiffreDesDizaines == 5:
            lc(); pqtd(); av(); pqtg(); bc()
            dix(); dix()
            lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
            dix(); dix(); dix()
            lc(); avf(-2); bc()
        else:
            pass

    def unitesDesUnitesSexagesimales(chiffreDesUnites):
        if chiffreDesUnites == 1:
            un(4)
        elif chiffreDesUnites == 2:
            un(4); un(4)
        elif chiffreDesUnites == 3:
            un(4); un(4); un(4)
        elif chiffreDesUnites == 4:
            lc(); pqtd(); av(); pqtg(); bc()
            lg(x * 2); teteDeClou()
            lg(x)
            lc(); avf(4); pqtg(); avf(5); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        elif chiffreDesUnites == 5:
            lc(); pqtd(); av(); pqtg(); bc()
            un(2); un(2)
            lc(); avf(4); pqtg(); avf(5); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        elif chiffreDesUnites == 6:
            un(2); un(2); un(2)
            lc(); avf(4); pqtg(); avf(6); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        elif chiffreDesUnites == 7:
            lc(); pqtd(); av(); pqtg(); bc()
            lgX(x * 2); teteDeClou()
            lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        elif chiffreDesUnites == 8:
            lc(); pqtd(); av(); pqtg(); bc()
            teteDeClou(); teteDeClou()
            lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        elif chiffreDesUnites == 9:
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
            teteDeClou(); teteDeClou(); teteDeClou()
            lc(); avf(-4); bc()
        else:
            pass

    # En position médiale et uniquement pour marquer
    # l'absence d'unités dans cette position
    def zeroBabylonien():
        lc(); pqtd(); avf(6); bc()
        p3htg(); avf(3); lg(x * 2); vd()
        avf(-1); vd()
        lc(); pdt(); lg(x); av(); bc()
        lg(x * 2); vd()
        avf(-1)
        vd(); lc(); lg(x * 4); av()
        p3htg(); bc(); lg(x)

    def unitesEnBabylonien(unitesSexagesimales):
        if unitesSexagesimales == 0:
            zeroBabylonien()
        else:
            choix = unitesSexagesimales // 10
            if choix == 1:
                dizainesDesUnitesSexagesimales(1)
            elif choix == 2:
                dizainesDesUnitesSexagesimales(2)
            elif choix == 3:
                dizainesDesUnitesSexagesimales(3)
            elif choix == 4:
                dizainesDesUnitesSexagesimales(4)
            elif choix == 5:
                dizainesDesUnitesSexagesimales(5)
            else:
                pass
            espacement(1)
            choix2 = unitesSexagesimales % 10
            if choix2 == 1:
                unitesDesUnitesSexagesimales(1)
            elif choix2 == 2:
                unitesDesUnitesSexagesimales(2)
            elif choix2 == 3:
                unitesDesUnitesSexagesimales(3)
            elif choix2 == 4:
                unitesDesUnitesSexagesimales(4)
            elif choix2 == 5:
                unitesDesUnitesSexagesimales(5)
            elif choix2 == 6:
                unitesDesUnitesSexagesimales(6)
            elif choix2 == 7:
                unitesDesUnitesSexagesimales(7)
            elif choix2 == 8:
                unitesDesUnitesSexagesimales(8)
            elif choix2 == 9:
                unitesDesUnitesSexagesimales(9)
            else:
                pass
        espacement(4)

    def nombreEnBabylonien(c):
        if c < 60:
            unitesEnBabylonien(c)
        else:
            nombreEnBabylonien(c // 60)
            unitesEnBabylonien(c % 60)

    eb(); ag(); lc(); av(); pqtd(); av(); pqtg()
    bc()
    lg(x)
    nombreEnBabylonien(nombreACoder)

# Numération égyptienne
def numerationEgyptienne(nombreACoder):
    g = 6  # Taille de la grille
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
        phtg(); lc(); lgX(x / 2); av(); pqtg()
        bc(); lg(x)

    # Lotus
    def dixPuissanceTrois():
        x = valLgX()
        # Bas
        lg(x / 2 * 3); vd(); vd(); pqtd(); avf(2)
        # Tige
        lc(); avf(-1); pqtd(); av(); bc(); lg(x)
        phtg(); av(); avf(-1); pqtd()
        av(); avf(-1); phtg(); lg(x / 2 * 15)
        av()
        # Fleur
        lgX(x); lgY(x / 2); pqtd(); vg(); phtg()
        av(); pqtd(); av(); phtg(); vg()
        lgX(x / 2 * 3); lgY(x); vg(); vg()
        # Se plaçer à droite du dessin orienté au nord
        lc(); pqtd(); lg(x / 2); avf(18); pqtg()
        avf(3); pqtg(); bc(); lg(x)

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
        vd(); phtd(); lg(x * 2); vd(); lc()
        p3htd(); lg(x); av(); bc(); dp()
        # Dos
        lc(); pdt(); av(); bc(); pqtd()
        lgY(x / 2); lgX(x); vg(); lgX(x / 2 * 7)
        lgY(x * 2); vd()
        # Queue
        phtg(); lgX(x * 3); lgY(x * 2); vg()
        pdt(); lgX(x * 4); lgY(x * 3)
        vd(); p3htg(); lgX(x / 2); lgY(x); vd()
        # Plaçer le robot à droite du dessin orienté au
        # nord
        lc(); pdt(); lgX(x * 5); av(); pqtg()
        lg(x); bc()

    # Un Génie
    def tete():
        x = valLgX()
        vg(); vg(); phtd(); lgX(x / 2); vg()
        phtg(); lgX(x / 2 * 3)
        lgY(x * 2); vg()
        # Coiffe
        lc(); lg(x); pqtg(); av(); bc(); phtd()
        lg(x / 2)
        av(); vg(); phtg(); vg(); lc(); phtg(); av()
        bc(); pqtg(); av(); vd()
        phtd(); vd()
        lc(); pqtg(); lgX(x / 2 * 3)
        lgY(x * 2); av(); bc(); lg(x)

    def brasDroit():
        x = valLgX()
        lgY(x * 3); av(); lg(x / 2); p3htg()
        vg(); phtg(); vg()
        lc(); pdt(); lgX(x / 2); lgY(x * 3)
        av(); bc(); lg(x)

    def brasGauche():
        x = valLgX()
        lgY(x * 3); av(); lg(x / 2); p3htd()
        vd(); phtd(); vd()
        lc(); pdt(); lgX(x / 2); lgY(x * 3)
        av(); bc(); lg(x)

    # Génie du million
    def dixPuissanceSix():
        x = valLgX()
        # Cuisse gauche
        lc(); pqtd(); lgX(x / 2); av(); pqtg()
        bc(); lg(x * 2); vd()
        # Côté droit du corps
        phtg(); lgX(x / 2); vg(); phtd(); lgX(x)
        lgY(x * 4); vg(); phtd()
        # Bras droit, tête, bras gauche
        lg(x); brasDroit(); lgX(x / 2 * 7)
        lgY(x * 2); vg(); lg(x)
        brasGauche(); lc(); phtd(); av(); bc()
        p3htd(); tete()
        # Côté gauche du corps
        p3htd(); lgY(x * 3); vg(); lgX(x / 2)
        lgY(x * 3); vg(); phtd()
        lgX(x); lgY(x * 2); vd(); lg(x)
        # Jambe gauche
        p3htg(); lgX(x / 2); av(); avf(-9)
        # Jambe et cuisse droites
        lc(); lgY(x / 2 * 3); lgX(x / 2)
        phtg(); av(); bc(); lgX(x / 2)
        lgY(x * 2); pqtg(); av(); pdt()
        lgX(x * 2); lgY(x / 2 * 3); av()
        # Placer le robot à droite du dessin orienté au
        # nord
        lc(); lgX(x * 7 / 2); lgY(x * 2); av()
        lg(x); p3htg(); bc()

    # Taille des hiéroglyphes de 10 puissance p
    def largeur(p):
        if p == 6:
            return 6
        elif p == 5:
            return 10
        elif p in (3, 2):
            return 3
        elif p == 1:
            return 2
        else:
            return 0

    def hauteur(p):
        if p in (6, 4, 3):
            return 11
        elif p == 5:
            return 4
        elif p in (2, 1, 0):
            return 3
        else:
            return 0

    # Disposition des hiéroglyphes
    def lignes(chiffre):
        if chiffre in (1, 2, 3):
            return 1
        elif chiffre in (4, 5, 6, 7, 8):
            return 2
        elif chiffre == 9:
            return 3
        else:
            return 0

    # Nombre de colonnes de la 1re et de la 2e ligne
    def colonnes1(chiffre):
        if chiffre == 1:
            return 1
        elif chiffre in (2, 4, 5):
            return 2
        elif chiffre in (3, 6, 7, 9):
            return 3
        elif chiffre == 8:
            return 4
        else:
            return 0

    def colonnes2(chiffre):
        if chiffre == 4:
            return 2
        elif chiffre in (5, 6, 9):
            return 3
        elif chiffre in (7, 8):
            return 4
        else:
            return 0

    # Espaces entre les lignes et entre les colonnes
    def espaceLig(p, chiffre):
        if chiffre == 0:
            return 0
        elif chiffre >= 4 and chiffre <= 8 and (p == 3 or p == 4):
            return 2
        else:
            return 1

    def espaceCol(p, chiffre):
        if chiffre < 2 or chiffre > 9:
            return 0
        elif p == 5:
            return -2
        elif p >= 0 and p <= 6:
            return 1
        else:
            return 0

    # Largeur d'un hiéroglyphe et de l'espace qui le
    # suit
    def pas(p, chiffre):
        return largeur(p) + espaceCol(p, chiffre)

    # Taille de la grille dans l'écriture horizontalement
    # ou verticalement
    def grilleH(p, chiffre):
        x = valLgX()
        if (p == 3 or p == 4) and chiffre >= 4 and chiffre <= 8:
            return x / 11 * 5
        elif (p == 3 or p == 4) and chiffre == 9:
            return x / 22 * 7
        elif p <= 2 and p >= 0:
            return x / 2
        elif p == 5:
            return x / 4 * 3
        else:
            return x

    def grilleV(p):
        if p >= 3 and p <= 6:
            return valLgX() / 4 * 3
        else:
            return valLgX() / 2

    # Largeur d'une colonne dans la représentation
    # hybride
    def largeurCoefficient(valeurPrecedente, p, nombre):
        chiffre = nombre % 10
        v = colonnes1(chiffre) * pas(p, chiffre) + largeur(p) if colonnes1(chiffre) == colonnes2(chiffre) - 1 else colonnes1(chiffre) * pas(p, chiffre)
        maxi = max(v, valeurPrecedente)
        if nombre < 10:
            return maxi
        else:
            return largeurCoefficient(maxi, p + 1, nombre // 10)

    # Déplacer le robot crayon levé de n fois la taille
    # de la grille, à droite si n >= 0, à gauche sinon
    def espacement(n):
        x = valLgX()
        lc()
        if n > 0:
            pqtd(); lg(x * n); av(); pqtg()
        else:
            pqtg(); lg(-(x * n)); av(); pqtd()
        bc(); lg(x)

    # Écrire le chiffre ch des 10 puissance p,
    # horizontalement si h vaut true
    def ecrireChiffreEnHieroglyphes(h, p, ch):
        c = colonnes1(ch)
        x = valLgX()
        if ch != 0:
            if h:
                lg(grilleH(p, ch))
                if c == colonnes2(ch) - 1:
                    espacement(pas(p, ch) / 2)
            else:
                lg(grilleV(p))
                espacement(-((colonnes1(ch) * pas(p, ch) - espaceCol(p, ch)) / 2))
            for j in range(lignes(ch)):
                for i in range(c):
                    if p == 6:
                        dixPuissanceSix()
                    elif p == 5:
                        dixPuissanceCinq()
                    elif p == 4:
                        dixPuissanceQuatre()
                    elif p == 3:
                        dixPuissanceTrois()
                    elif p == 2:
                        dixPuissanceDeux()
                    elif p == 1:
                        dixPuissanceUn()
                    elif p == 0:
                        dixPuissanceZero()
                    else:
                        pass
                    # Colonne suivante
                    espacement(espaceCol(p, ch))
                # Ligne suivante
                lc(); avf(hauteur(p) + espaceLig(p, ch)); bc()
                espacement(-(c * pas(p, ch)))
                if c == colonnes2(ch) - 1:
                    espacement(-(pas(p, ch) / 2))
                    c = colonnes2(ch)
            # Se placer pour tracer le ch suivant
            if h:
                espacement(c * pas(p, ch) - espaceCol(p, ch))
                lc()
                avf(-(lignes(ch) * (hauteur(p) + espaceLig(p, ch))))
                bc()
                espacement(2)
                if p >= 1 and p <= 4:
                    espacement(1)
            else:
                espacement((c * pas(p, ch) - espaceCol(p, ch)) / 2)
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

    horizontalement = True
    if nombreACoder >= 1000000000:
        message("Trop grand pour les hiéroglyphes égyptiens.")
    # Initialisation
    else:
        cacherRobot()
        eb(); ag(); lg(12); lc(); av(); pqtd(); av()
        pqtg(); bc(); lg(g)
        espacement(2)
        # Représentation classique
        if nombreACoder < 2000000:
            ecrireNombreEnHieroglyphes(horizontalement, 0, nombreACoder)
        # Représentation hybride et grands nombres
        if nombreACoder >= 2000:
            eb(); ag(); lg(12); lc(); av(); pqtd(); av()
            pqtg(); bc(); lg(g)
            espacement(2)
            # Colonne de la plus forte puissance (génie,
            # têtard, index ou lotus) à multiplier
            pf = plusFortePuissance(nombreACoder)
            p = pf if pf == 3 else pf - 1 if pf == 4 else pf - 2
            coefficient = nombreACoder // dixPuissance(p)
            l = largeurCoefficient(largeur(p), 0, coefficient)
            espacement(l / 2)
            ecrireNombreEnHieroglyphes(not horizontalement, 0, coefficient)
            ecrireChiffreEnHieroglyphes(not horizontalement, p, 1)
            eb(); lg(12); lc(); pn(); av(); bc()
            lg(g)
            espacement(l / 2 + 1)
            # Ligne du reste du nombre
            ecrireNombreEnHieroglyphes(horizontalement, 0, nombreACoder % dixPuissance(p))

# Numération grecque
def numerationGrecque(nombreACoder):
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
        avf(9); pqtd(); avf(6); pqtd(); avf(3); pqtd()
        avf(3)
        pqtg(); avf(2); avf(-2); pqtd(); avf(3); lc()
        avf(-6)
        pqtd(); avf(-6); bc(); ec(c)

    def dix(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        lgY(valLgY() * 3); phtd(); av(); pqtd()
        av(); p3htd(); avf(2)
        lc(); pdt(); avf(2); pqtg(); bc()
        lg(x); ec(c)

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
        lc(); lg(x / 2); avf(11)
        lg(x); pqtd(); avf(2); pqtg()
        bc()
        dix(False)
        lc(); pqtg(); avf(4); pqtg()
        lg(x / 2); avf(11)
        lg(x)
        pdt(); bc()
        cinq()

    def cinquanteTalents():
        lc(); lg(x / 2); avf(11)
        lg(x); pqtd(); avf(2); pqtg()
        bc()
        dixTalents(False)
        lc(); pqtg(); avf(4); pqtg()
        lg(x / 2); avf(11)
        lg(x)
        pdt(); bc()
        cinq()

    def cent(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        avf(3); lgY(valLgY() / 2); avf(-3); pqtd()
        avf(2); pqtg()
        avf(3); avf(-6); lg(x); ec(c)

    def centTalents(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        avf(3); lgY(valLgY() / 2); avf(-3); pqtd()
        av(); pqtd()
        lgY(valLgY() * 4 / 3); av(); avf(-1)
        pqtg(); av(); pqtg()
        lgY(valLgY() * 3 / 4); avf(3); avf(-6)
        lg(x); ec(c)

    def cinqCents():
        lc(); avf(5); pqtd(); avf(4); pqtg(); bc()
        cent(False)
        lc(); pqtg(); avf(6); pqtg(); avf(5); pdt()
        bc()
        cinq()

    def cinqCentsTalents():
        lc(); avf(5); pqtd(); avf(4); pqtg(); bc()
        centTalents(False)
        lc(); pqtg(); avf(6); pqtg(); avf(5); pdt()
        bc()
        cinq()

    def mille(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        lgX(valLgX() * 2); lgY(valLgY() * 3)
        phtd(); av()
        lc(); p3htg(); av(); p3htg(); bc(); av()
        p3htg(); lg(x); ec(c)

    def milleTalents(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        lgY(valLgY() / 3 * 2); lc(); pqtd(); av()
        pqtg(); bc(); av(); pqtd()
        av(); avf(-2); phtg(); lgX(valLgX() * 2)
        lgY(valLgY() * 7 / 2)
        av(); lc(); p3htg(); av(); p3htg(); bc()
        av(); p3htg()
        lgY(valLgY() * 2 / 7)
        lc(); avf(-1); bc(); lg(x); ec(c)

    def cinqMille():
        lc(); lg(x / 2); avf(11)
        lg(x); pqtd(); avf(2); pqtg()
        bc()
        mille(False)
        lc(); pqtg(); avf(4); pqtg()
        lg(x / 2); avf(11)
        lg(x)
        pdt(); bc()
        cinq()

    def cinqMilleTalents():
        lc(); lg(x / 2); avf(11)
        lg(x); pqtd(); avf(2); pqtg()
        bc()
        milleTalents(False)
        lc(); pqtg(); avf(4); pqtg()
        lg(x / 2); avf(11)
        lg(x)
        pdt(); bc()
        cinq()

    def dixMille(grandeTaille):
        if grandeTaille:
            lg(x * 3); ec(c * 2)
        avf(3); lgY(valLgY() * 2); p3htd(); av()
        pqtg(); av()
        lgY(valLgY() / 2); p3htd(); avf(3); pdt()
        lg(x); ec(c)

    def cinquanteMille():
        lc(); lg(x / 2); avf(11)
        lg(x); pqtd(); avf(2); pqtg()
        bc()
        dixMille(False)
        lc(); pqtg(); avf(4); pqtg()
        lg(x / 2); avf(11)
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

    ec(c); eb(); ag(); lc(); pne(); av(); pn()
    bc(); lg(x)
    ecrireNombreEnGrec(nombreACoder)

# Numération romaine
def numerationRomaine(nombreACoder):
    x = 3  # Taille de la grille
    def espacement(n):
        lc(); pqtd(); avf(n); pqtg(); bc()

    def un():
        avf(6); avf(-6)
        espacement(2)

    def cinq():
        lc(); avf(6); bc(); p3htd()
        lgX(x * 2)
        lgY(x * 6)
        av()
        pqtg(); av(); lc(); p3htd(); av(); pdt()
        bc(); lg(x)
        espacement(2)

    def dix():
        lgX(x * 4)
        lgY(x * 6); phtd(); av(); lc()
        p3htg()
        av(); bc()
        p3htg(); av(); lc(); p3htg(); bc()
        lg(x)
        espacement(2)

    def cinquante():
        avf(6); avf(-6); pqtd(); avf(4)
        pqtg()
        espacement(2)

    def cent():
        lc(); lgX(x * 4)
        lgY(x * 2); phtd(); av(); bc()
        lgX(x * 2)
        p3htd(); vd(); lgY(x * 3); vd()
        vd(); lgY(x * 2)
        vd(); lc()
        avf(2); pdt(); bc(); lg(x)
        espacement(2)

    def cinqCents():
        avf(6); pqtd(); avf(1); lg(x * 3)
        vd(); vd(); lg(x)
        av()
        lc(); avf(-4); pqtd(); bc()
        espacement(2)

    def mille():
        avf(6); lgX(x * 2)
        lgY(x * 5); p3htd(); av()
        pqtg()
        av()
        lg(x); p3htd(); avf(6); pdt()
        espacement(2)

    def surligner(n):
        lc(); avf(8); pqtg(); avf(2); bc(); avf(n - 2)
        avf(-(n - 2))
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
            cinquante(); mille()
            ecrireNombreEnRomain(n - 950)
        elif n >= 900:
            cent(); mille(); ecrireNombreEnRomain(n - 900)
        elif n >= 500:
            cinqCents(); ecrireNombreEnRomain(n - 500)
        elif n >= 400:
            cent(); cinqCents()
            ecrireNombreEnRomain(n - 400)
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
        elif n == 0:
            pass

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
            message("Trop grand pour les chiffres romains.")
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

    ag(); eb(); lc(); av(); pqtd(); av(); pqtg()
    bc(); lg(x)
    espacement(2)
    nombreEnRomain(nombreACoder)

# Numération hexadécimale
def decimalEnHexadecimal(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnHexadecimal(-n)
    elif n >= 16:
        decimalEnHexadecimal(n // 16)
        decimalEnHexadecimal(n % 16)
    elif n == 15:
        ecrire("F"); translater(1, 0)
    elif n == 14:
        ecrire("E"); translater(1, 0)
    elif n == 13:
        ecrire("D"); translater(1, 0)
    elif n == 12:
        ecrire("C"); translater(1, 0)
    elif n == 11:
        ecrire("B"); translater(1, 0)
    elif n == 10:
        ecrire("A"); translater(1, 0)
    else:
        ecrire(str(n)); translater(1, 0)

# Numération décimale
def decimalEnDecimal(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnDecimal(-n)
    elif n >= 10:
        decimalEnDecimal(n // 10)
        decimalEnDecimal(n % 10)
    else:
        ecrire(str(n)); translater(1, 0)

# Numération octale
def decimalEnOctal(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnOctal(-n)
    elif n >= 8:
        decimalEnOctal(n // 8)
        decimalEnOctal(n % 8)
    else:
        ecrire(str(n)); translater(1, 0)

# Numération ternaire
def decimalEnTernaire(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnTernaire(-n)
    elif n == 0:
        ecrire("0"); translater(1, 0)
    elif n == 1:
        ecrire("1"); translater(1, 0)
    elif n == 2:
        ecrire("2"); translater(1, 0)
    else:
        decimalEnTernaire(n // 3)
        decimalEnTernaire(n % 3)

# Numération binaire
def decimalEnBinaire(n):
    if n < 0:
        ecrire("-"); translater(1, 0)
        decimalEnBinaire(-n)
    elif n == 0:
        ecrire("0"); translater(1, 0)
    elif n == 1:
        ecrire("1"); translater(1, 0)
    else:
        decimalEnBinaire(n // 2)
        decimalEnBinaire(n % 2)

# Nombre à coder
nombreACoder = 123456789

# Annoncer le codage dans la numération nom
def annoncer(nom):
    message("Codage de " + str(nombreACoder) + " en numération " + nom + ".")

# Attendre avant de passer à la numération suivante
def suivant():
    bip(); bip(); marquerUnePause(); cf(blanc)

# Écrire en grands chiffres en bas à gauche
def enChiffres():
    lg(16); policeTexte(courier); styleTexte(gras)
    tailleTexte(24); eb(); ag()

annoncer("babylonienne")
numerationBabylonienne(nombreACoder); suivant()
annoncer("égyptienne")
numerationEgyptienne(nombreACoder); suivant()
annoncer("grecque")
numerationGrecque(nombreACoder); suivant()
annoncer("romaine")
numerationRomaine(nombreACoder); suivant()
enChiffres(); annoncer("hexadécimale")
decimalEnHexadecimal(nombreACoder); suivant()
enChiffres(); annoncer("décimale")
decimalEnDecimal(nombreACoder); suivant()
enChiffres(); annoncer("octale")
decimalEnOctal(nombreACoder); suivant()
enChiffres(); annoncer("ternaire")
decimalEnTernaire(nombreACoder); suivant()
enChiffres(); annoncer("binaire")
decimalEnBinaire(nombreACoder); suivant()
