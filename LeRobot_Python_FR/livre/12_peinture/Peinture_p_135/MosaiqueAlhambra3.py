from LibRobot import *

# Mosaïque de l'Alhambra
tailleGrille = 3  # pixels
largeurMotif = 4  # fois la taille de la grille
hauteurMotif = 6  # fois la taille de la grille
tailleLigne = 7  # motifs d'une ligne impaire
nombreDeLignes = 12  # pair

# Dessiner un motif en forme de 8, en partant et en
# arrivant à l'extrémité de la pointe inférieure
# gauche, avec le robot orienté vers le nord.
def motif():
    for i in range(2):
        # Côté gauche/droit (au dessus/dessous de la
        # pointe inférieure).
        phtd(); av(); phtg(); avf(hauteurMotif - 4)
        phtg(); av(); pqtd(); av()
        # Dessus/dessous
        phtd(); avf(largeurMotif - 2); phtd()
        # Haut/bas du côté droit/gauche (en dessus/dessous
        # de la pointe supérieure/inférieure).
        av(); phtd()
    # Colorier et tourner le robot dans l'orientation
    # initiale.
    pqtg(); peindre(); pqtd()

# Passer de la pointe inférieure gauche d'un motif à
# celle du motif suivant sur la même ligne
# horizontale à droite.
def motifSuivant():
    lc(); pqtd(); avf(2 * largeurMotif); pqtg(); bc()

# Dessiner une ligne horizontale comportant
# tailleLigne motifs.
def ligneImpaire():
    for i in range(tailleLigne):
        motif(); motifSuivant()

# Dessiner une ligne comportant (tailleLigne - 1)
# motifs.
def lignePaire():
    for i in range(tailleLigne - 1):
        motif(); motifSuivant()

# Revenir sur la pointe inférieure gauche du premier
# motif d'une ligne.
def retourDebutDeLigne():
    lc(); pqtg()
    avf(2 * largeurMotif * tailleLigne - largeurMotif)
    pqtd(); bc()

# Passer de la pointe inférieure gauche d'un motif à
# celle du motif à la verticale sur la ligne
# suivante.
def ligneSuivante():
    lc(); avf(-(hauteurMotif - 2)); bc()

# Paver avec un nombre de lignes égal à
# nombreDeLignes.
def pavage():
    for i in range(nombreDeLignes // 2):
        ligneImpaire(); retourDebutDeLigne()
        ligneSuivante()
        lignePaire(); retourDebutDeLigne()
        ligneSuivante()

# Placer le robot à la pointe inférieure gauche du
# motif gauche de la première ligne.
lc(); lg(tailleGrille); ag(); eh(); pdt()
avf(hauteurMotif); pqtg(); av(); pqtg(); bc()
pavage(); st()
