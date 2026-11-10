# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Moyens de transport, page 10.                       *
# *                                                     *
# *******************************************************
from LibRobot import *

# Dessiner un hélicoptère
# Rotor et pales
avf(2); pqtg(); avf(13); pdt(); avf(26); pdt(); avf(14); pqtg(); avf(2)
# Moitié droite du toit de la cabine
pqtg(); avf(5); phtd(); av(); phtd(); av()
# Queue
pqtg(); avf(12); pqtg(); avf(2); pqtd(); avf(2); pqtd(); av()
# Rotor anticouple
lc(); pqtd(); av(); bc()
phtg(); avf(2); pdt(); avf(4); pdt(); avf(2); pqtd(); avf(2); pdt(); avf(4)
pdt()
avf(2)
lc(); p3htd(); av(); pqtd(); bc()
avf(3); pqtd(); avf(14)
# Arrière de la cabine
pqtd(); avf(2); pdt(); avf(4); phtd(); av(); phtd()
# Dessous de la cabine
avf(3); pqtg()
# Patins d'atterrissage
avf(2); pqtg(); avf(4); phtg(); av(); pdt(); av(); phtd(); avf(14); phtd()
av()
pdt(); av(); phtg()
avf(4); pqtg(); avf(2)
pqtd(); avf(6); pdt(); avf(8)
# Porte
pqtd(); avf(4); phtd(); av(); phtd(); av(); phtd(); av(); phtd(); avf(4)
pqtd()
avf(5)
# Avant de la cabine
phtd(); avf(2); phtd(); avf(3)
lc(); pqtd(); avf(2); dc(); pdt(); avf(2); bc()
p3htd(); avf(2)
# Moitié gauche du toit de la cabine
phtd(); avf(8)
st()
