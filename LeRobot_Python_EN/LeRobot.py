"""LeRobot -- the drawing robot, with English command names (the interface
of the original version, used by mon_dessin.py: a program starts with
init_pict(); gc()).

    from LeRobot import *

The robot itself is the French library (LeRobotFR.py); the table of the
English names is in noms.py.
"""
import LeRobotFR as _fr
import noms as _noms

_noms.exporter(_fr, globals())
del _noms
