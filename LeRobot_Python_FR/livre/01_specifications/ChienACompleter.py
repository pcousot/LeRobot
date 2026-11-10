# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Dessins à compléter, page 7.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessin d'un chien à compléter
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

# Mémorisation de la taille du crayon
tailleCrayon = 0

def memoriserTailleCrayon():
    global tailleCrayon
    tailleCrayon = valEc()

def reprendreTailleCrayon():
    ec(tailleCrayon)

# Initialisation
# Adaptation : en Pascal, eb ; la fenetre du robot etant plus haute,
# le chien partirait du bord inferieur ; on le centre verticalement.
lc(); lg(30); ec(2); dg(); ce(); translater(0, -5)
policeTexte(times); tailleTexte(9); numero = 0; numeroterE()
# Profil arrière de la patte avant
avf(2); numeroterE(); pqtd()
# Ventre
avf(3); numeroterE(); vg(); numeroterE()
# Patte arrière
pdt(); avf(3); numeroterE(); pqtg(); av(); numeroterE(); pqtg(); avf(4)
# Queue
avf(2); numeroterE(); vd(); numeroterE(); pdt(); vg(); vd(); numeroterE()
# Dos
avf(3); numeroterE(); vd(); numeroterE()
# Tête
# Oreille
av(); av(); numeroterE(); pqtg(); av(); numeroterE(); pqtg(); av()
numeroterE()
# Oeil
# lc;
av(); memoriserTailleCrayon(); ec(4); dp(); reprendreTailleCrayon(); pdt()
av()  # bc;
pqtg(); av(); numeroterE(); pqtg(); av(); numeroterE()
# Museau
pqtd(); avf(2); numeroterE(); pqtg(); avf(2); numeroterE(); pqtg()
# Gueule
vg(); numeroterE(); pdt(); vd(); numeroterW(); pdt(); avf(2); numeroterE()
vd()
numeroterE()
# Profil avant de la patte avant
avf(3); numeroterW(); pqtg(); av(); numeroterW()
st()
