# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Dessins à compléter, page 7.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner un bateau à voiles à completer
# Mémorisation de la direction courante du robot
orientationCourante = 0

def memoriserDirection():
    global orientationCourante
    # Mémoriser la direction courante du robot dans 'OrientationCourante'
    orientationCourante = valOrientation()

def reprendreDirection():
    # Mettre le robot dans la direction mémorisée dans 'OrientationCourante'
    pivoter(orientationCourante)

# Mémorisation de la taille de la grille
tailleHorizontale = 0
tailleVerticale = 0

def memoriserTailleGrille():
    global tailleHorizontale, tailleVerticale
    tailleHorizontale = valLgX()
    tailleVerticale = valLgY()

def reprendreTailleGrille():
    lgX(tailleHorizontale)
    lgY(tailleVerticale)

# Mémorisation de la position du crayon
crayonBaisse = False

def memoriserPositionCrayon():
    global crayonBaisse
    crayonBaisse = valBc()

def reprendrePositionCrayon():
    if crayonBaisse:
        bc()
    else:
        lc()

# Mémoriser le numéro de la position courante du robot
numero = 0

def numeroterE():
    global numero
    # Marquer d'une croix la position courante du robot, la numéroter
    # à  l'est  avec  la  valeur de 'Numero' qui est incrementé, sans
    # changer la position et l'orientation du robot.
    dc()
    memoriserDirection(); memoriserTailleGrille(); memoriserPositionCrayon()
    lg(valEc() + 3); pe(); lc(); av(); ecrire(entierEnChaine(numero))
    pdt(); av()
    reprendreDirection(); reprendreTailleGrille(); reprendrePositionCrayon()
    numero += 1

def numeroterW():
    global numero
    # Marquer d'une croix la position courante du robot, la numéroter
    # à  l'ouest  avec la valeur de 'Numero' qui est incrementé, sans
    # changer la position et l'orientation du robot.
    dc()
    memoriserDirection(); memoriserTailleGrille(); memoriserPositionCrayon()
    lg(valEc() + 10); pw(); lc(); av(); ecrire(entierEnChaine(numero))
    pdt(); av()
    reprendreDirection(); reprendreTailleGrille(); reprendrePositionCrayon()
    numero += 1

# Initialisation
lg(12); ec(2); dg()
policeTexte(times); tailleTexte(9); numero = 0
# Déplacer le robot en bas sans rien dessiner
lc(); pdt(); avf(10); numeroterE(); pqtg()
# Dessiner l'arriere de la coque
# Dessiner la ligne de flotaison arrière
# bc;
avf(9); numeroterE()
# Dessiner l'arrière de la coque
phtg(); avf(4); numeroterE()
# Dessiner le pont arrière
pqtg(); phtg(); avf(13); numeroterE()
# Dessiner le mât
pqtd(); avf(16); numeroterE()
# Dessiner le drapeau
pqtd(); avf(4); numeroterE(); pqtd(); avf(2); numeroterE(); pqtd(); avf(4)
numeroterE(); pqtg(); av(); numeroterE()
# Dessiner la grand voile
phtg(); avf(12); numeroterE()
pqtd(); phtd(); avf(12)
# Dessiner le foc
avf(9); numeroterE(); pqtd(); phtd()
avf(9); numeroterE(); pqtd(); phtd()
avf(10); numeroterW(); pqtd()
# Dessiner l'avant du bateau
# Dessiner le pont avant
avf(10); numeroterE()
# Dessiner l'avant de la coque
pdt(); phtd(); avf(4); numeroterE()
# Dessiner la ligne de flotaison avant
phtg(); avf(6); numeroterW()
st()
