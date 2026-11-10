# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# *                                                     *
# *******************************************************

# Manual translation: in Turbo Pascal, interaction (X, Y, Ch, false,
# true, true, false, true) then copier generated the program
# Dessin_du_Robot.p. In Python, interaction(coordinates, turns,
# drawing, mouseEnds, save) ends the drawing with the Return key
# and, if one answers y, saves it in the program my_drawing.py
# (run by  make my_drawing).
from LibRobot import *

message(keyboardCommandsMemento)
interaction(False, True, True, False, True)
