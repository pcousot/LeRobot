# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Erreurs d'arrondi, pages 219-220.                   *
# *                                                     *
# *******************************************************
from LibRobot import *

writeln("0.1 + 0.2 = ")
writeln("  ", sprintf("%.25f", 0.1 + 0.2))
writeln("<> 0.3000000000000000000000000 ! ")
writeln()
writeln("Terminer en tapant 'retour-chariot' ou 'control + C'")
readln()
