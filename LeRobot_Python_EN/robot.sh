#!/bin/zsh
# robot.sh -- runs a robot program (Python) in the robot's window.
#
#   ./robot.sh path/to/Program.py
#
# The program can be anywhere: the library (this folder) is added to
# Python's path. The program is run from its own folder (Draw writes
# my_drawing.py there).
#
# macOS's python3 (/usr/bin/python3) has Tk 8.5, which no longer works: the
# library then restarts itself with a Python linked to Tk 8.6 (python.org or
# Homebrew python-tk). LEROBOT_PYTHON=... forces a given Python.

[ $# -ge 1 ] && [ -f "$1" ] || { echo "usage: $0 Program.py"; exit 1; }
here=${0:A:h}
src=${1:A}
export PYTHONPATH=$here${PYTHONPATH:+:$PYTHONPATH}
cd ${src:h} || exit 1
exec ${LEROBOT_PYTHON:-python3} ${src:t} "${@[2,-1]}"
