from LibRobot import *

# Dessiner un pavage de roues dentées
tailleGrille = 10
nombreDeMotifsParLigne = 7
nombreDeLignes = 14

# Avancer le robot tout droit, jusqu'à deux carreaux
# du bord nord du cadre.
def enHaut():
    eh(); pdt(); avf(2)

# Dessiner le motif du pavage
def roueDentee():
    for i in range(4):
        av(); pqtd(); vd(); pqtg(); vg(); pqtg()

def pavage():
    for l in range(1, nombreDeLignes + 1):
        lc(); enHaut(); ag()
        avf(l); pqtg(); av()
        # Décalage en début de ligne
        if l % 5 == 2:
            avf(2)
        elif l % 5 == 3:
            avf(4)
        elif l % 5 == 4:
            av()
        elif l % 5 == 0:
            avf(3)
        # Dessiner une ligne de motifs
        pqtg(); bc()
        for j in range(nombreDeMotifsParLigne - 1):
            roueDentee()
            translater(5, 0)
        roueDentee()

lg(tailleGrille); pavage(); st()
