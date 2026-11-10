"""LibRobot -- the drawing robot of the book "First Programming Lessons in
Python", with English command names.

    from LibRobot import *

opens the robot's window, the robot being in the centre, facing north, pen
down, with a grid of 12 points. The commands are those of the French library
(LibRobotFR.py) under their English names (table in noms.py): fd(), qtr(),
pu(), pd(), gs(12), ...
"""
import LibRobotFR as _fr
import noms as _noms

# functions of Python's math and random modules, and the library's modules
# (some programs of the book use them directly)
from math import sqrt, sin, cos, tan, atan, atan2, exp, log, floor, ceil   # noqa: F401
from random import randrange, randint                                   # noqa: F401
from Utile import Stop                                                  # noqa: F401
import Graphics, Principal, Robot, Graph, Grille, Dessin, Ecriture, Peinture, Son  # noqa: F401,E401

_noms.exporter(_fr, globals())
del _noms
