from LibRobot import *

# Mosaïque de l'Alhambra
tailleGrilleX = 6
tailleGrilleY = 6
nombreDeMotifsParLigne = 4
nombreDeLignes = 4
largeurMotif = 6
hauteurMotif = 8
espaceEntreMotifs = 2  # > 1

# Distances entre deux motifs voisins
pasX = largeurMotif + espaceEntreMotifs
pasY = hauteurMotif + espaceEntreMotifs

def motif():
    vg(); pqtd(); av(); pqtg(); av()
    lgY(2 * tailleGrilleY); pqtd(); vg()
    lgY(tailleGrilleY); pqtd(); vd()
    pqtg(); av(); pqtd(); av(); pqtg()
    lgY(2 * tailleGrilleY); vd(); vd()
    lgY(tailleGrilleY); pqtg()
    av(); pqtd(); av(); pqtg(); vd(); pqtd()
    lgY(2 * tailleGrilleY); vg()
    pqtd(); lgY(tailleGrilleY)
    av(); pqtg(); av(); pqtd(); vg(); pdt()

def ligne():
    for i in range(nombreDeMotifsParLigne):
        motif(); translater(pasX, 0)

def pavage():
    for j in range(1, nombreDeLignes + 1):
        deplacer(-((nombreDeMotifsParLigne + j % 2) * pasX // 2), -(pasY * (j - nombreDeLignes // 2) // 2))
        ligne()

def cadre():
    translater(-(pasX // 2 * (1 // nombreDeLignes)) - largeurMotif // 2 * ((nombreDeLignes + 1) % 2) + espaceEntreMotifs // 2 * (nombreDeLignes % 2), -espaceEntreMotifs)
    for i in range(2):
        avf((nombreDeLignes + 1) // 2 * pasY + (hauteurMotif - espaceEntreMotifs) // 2 * ((nombreDeLignes + 1) % 2) + ((nombreDeLignes + 1) % 2 + 1) * espaceEntreMotifs)
        pqtg()
        avf(-(pasX // 2 * (1 // nombreDeLignes)) + nombreDeMotifsParLigne * pasX + pasX // 2 + espaceEntreMotifs)
        pqtg()

lgX(tailleGrilleX)
lgY(tailleGrilleY)
pavage(); cadre(); p3htd(); peindre()
st()
