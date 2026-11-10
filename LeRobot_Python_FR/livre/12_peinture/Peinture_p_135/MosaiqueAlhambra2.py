from LibRobot import *

# Mosaïque de l'Alhambra
tailleGrille = 4
tailleLigne = 7
nombreDeLignes = 8  # pair

def motif():
    lg(tailleGrille); av(); pqtd(); av()
    lgX(2 * tailleGrille)
    lgY(3 * tailleGrille); pqtg(); vd()
    lc(); avf(-1); bc(); vd()
    lg(tailleGrille); pqtg(); av(); pqtd()
    av(); pdt()

def motifSuivant():
    lc(); lg(tailleGrille); pqtd(); avf(2)
    pqtg(); bc()

def ligne():
    for i in range(tailleLigne):
        motif(); motifSuivant()

def retourDebutDeLigneImpaire():
    lc(); pqtg()
    avf(4 * tailleLigne + 2 * (tailleLigne - 1)); pqtd()
    bc()

def retourDebutDeLignePaire():
    lc(); pqtg()
    avf(4 * tailleLigne + 2 * tailleLigne + 3); pqtd()
    bc()

def pavage():
    for i in range(nombreDeLignes // 2):
        ligne()
        av(); pqtd(); av(); lc(); avf(-3); pqtg()
        avf(-1); bc(); retourDebutDeLigneImpaire()
        lc(); avf(-3); bc(); pqtd(); av(); pqtd()
        av(); pqtg(); lc(); avf(2); pqtg(); bc()
        ligne(); retourDebutDeLignePaire()
        lc(); avf(-4); bc()

def cadre():
    lc(); avf(4); bc()
    avf(4 * nombreDeLignes); pqtd()
    avf(4 * tailleLigne + 2 * (tailleLigne - 1) + 3)
    pqtd()
    avf(4 * nombreDeLignes); pqtd()
    avf(4 * tailleLigne + 2 * (tailleLigne - 1) + 3)
    pqtd()

def coloriage():
    lc(); avf(2); pqtd(); av()
    for i in range(nombreDeLignes // 2 - 1):
        for j in range(tailleLigne):
            peindre(); avf(6)
        peindre()
        pqtg(); avf(8); pqtg(); avf(6 * tailleLigne); pdt()
    for j in range(tailleLigne):
        peindre(); avf(6)
    peindre()

lc(); lg(tailleGrille); ag(); eh()
avf(-4); bc()
pavage(); cadre(); coloriage()
st()
