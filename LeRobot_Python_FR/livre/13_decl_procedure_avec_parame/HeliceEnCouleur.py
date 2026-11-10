from LibRobot import *

# Dessiner une hélice à quatre pales en couleur
tailleGrille = 18
epaisseurDuBord = 2

def demiCercleGauche(r):
    lg(r); vg(); vg()

def demiCercleDroit(r):
    lg(r); vd(); vd()

def pale(c):
    # Dessiner le pourtour de la pale
    ec(epaisseurDuBord); cc(noir)
    demiCercleGauche(tailleGrille)
    demiCercleDroit(tailleGrille)
    demiCercleDroit(2 * tailleGrille)
    # Peindre l'intérieur de la pale
    pqtd(); lg(tailleGrille)
    lc(); avf(3); cc(c); peindre(); avf(-3); bc()

def helice():
    pale(bleu); pale(indigo); pale(violet); pale(rouge)

helice(); st()
