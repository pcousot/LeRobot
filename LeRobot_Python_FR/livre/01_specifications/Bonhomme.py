# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Bonhomme, page 9.                                   *
# *                                                     *
# *******************************************************
from LibRobot import *

# Ceinture
pqtd(); av(); av(); pdt(); av(); av(); av(); av(); pdt(); av(); av()
# Entre-jambes
pqtd(); av(); av(); av(); av(); av(); av(); av()
# Pied gauche (à droite)
pqtg(); av(); av(); pqtd(); vd(); vd(); pdt()
# Pied droit (à gauche)
pqtd(); av(); av(); pqtg(); vg(); vg()
# Terminer la jambe droite (à gauche)
pqtd(); av(); av(); pqtg(); av(); av(); av(); av(); av(); av(); av()
# Bras droit (à gauche)
# Bord gauche du bras
av(); av(); av(); av(); pdt(); av(); av(); av(); av(); av()
# Main
pqtg(); av(); pqtd(); vd(); pqtd(); av(); pqtd(); av()
# Bord droit du bras
pqtg(); av(); av(); av(); av(); av(); av()
# Epaule droite (à gauche)
vg(); av(); av()
# Tête
vd(); av(); pqtd(); av(); pdt(); av(); av(); pdt(); vg(); vd(); vd(); vg()
pdt(); av(); av(); pdt(); av(); pqtd(); av(); vd()
# Epaule gauche (à droite)
av(); av(); vg()
# Bras gauche (à droite)
# Bord gauche du bras
av(); av(); av(); av(); av(); av()
# Main
pqtg(); av(); pqtd(); av(); pqtd(); vd(); pqtd(); av()
# Bord droit du bras
pqtg(); av(); av(); av(); av(); av(); pdt(); av(); av(); av(); av()
# Terminer la jambe gauche (à gauche)
av(); av(); av(); av(); av(); av(); av()
st()
