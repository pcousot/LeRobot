# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Rose des vents à huit directions, page 14.          *
# *                                                     *
# *******************************************************
from LibRobot import *

i = 0

# Branche N
ce(); pn(); lgY(60); av()  # axe central
ecrire(" N")
ce(); pnw(); lgY(12); av(); pqtd(); lgY(60); av(); pqtd(); av(); lgY(12)
pqtd()
av()
# Branche S
ce(); ps(); av(); lgY(60); av()  # axe central
ecrire(" S")
ce(); psw(); lgY(12); av(); pqtg(); lgY(60); av(); pqtg(); av(); lgY(12)
pqtg()
av()
# Branche W
ce(); pw(); av(); lgX(60); av()  # axe central
lc(); lgX(12); av(); ecrire("W"); pdt(); av(); pdt(); lgX(60); bc()
pdt(); av(); lgX(12); av(); pdt()
ce(); psw(); lgX(12); av(); pqtd(); lgX(60); av(); pqtd(); av(); lgX(12)
pqtd()
av()
# Branche E
ce(); pe(); av(); lgX(60); av()  # axe central
ecrire(" E")
ce(); pse(); lgX(12); av(); pqtg(); lgX(60); av(); pqtg(); av(); lgX(12)
pqtg()
av()
# Branche NW
ce(); pnw(); lgX(40); lgY(40); av()
lc(); lg(6); av(); ecrire("NW"); pdt(); av(); bc()
pse(); lgX(20); lgY(30); av(); pdt(); av()
pse(); lgX(30); lgY(20); av(); pdt(); av()
# Branche NE
ce(); pne(); lgX(40); lgY(40); av()
lc(); lg(6); av(); ecrire("NE"); pdt(); av(); bc()
psw(); lgX(20); lgY(30); av(); pdt(); av()
psw(); lgX(30); lgY(20); av(); pdt(); av()
# Branche SE
ce(); pse(); lgX(40); lgY(40); av()
lc(); lg(6); av(); ecrire("SE"); pdt(); av(); bc()
pnw(); lgX(20); lgY(30); av(); pdt(); av()
pnw(); lgX(30); lgY(20); av(); pdt(); av()
# Branche SW
ce(); psw(); lgX(40); lgY(40); av()
lc(); lg(6); av(); pw(); av(); av(); ecrire("SW"); pdt(); av(); av(); pne()
av(); bc()
pne(); lgX(20); lgY(30); av(); pdt(); av()
pne(); lgX(30); lgY(20); av(); pdt(); av()
ce(); pn(); st()
