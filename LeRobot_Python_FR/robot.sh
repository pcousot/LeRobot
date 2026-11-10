#!/bin/zsh
# robot.sh -- lance un programme Python du robot dans la fenetre du robot.
#
#   ./robot.sh chemin/du/Programme.py
#
# Le programme peut etre n'importe ou : la bibliotheque (ce repertoire) est
# ajoutee au chemin de Python. Le programme est lance depuis son repertoire
# (Dessiner y ecrit mon_dessin.py).
#
# python3 de macOS (/usr/bin/python3) a Tk 8.5, qui ne marche plus : la
# bibliotheque se relance alors d'elle-meme avec un Python lie a Tk 8.6
# (python.org ou Homebrew python-tk). LEROBOT_PYTHON=... impose un Python.

[ $# -ge 1 ] && [ -f "$1" ] || { echo "usage : $0 Programme.py"; exit 1; }
ici=${0:A:h}
src=${1:A}
export PYTHONPATH=$ici${PYTHONPATH:+:$PYTHONPATH}
cd ${src:h} || exit 1
exec ${LEROBOT_PYTHON:-python3} ${src:t} "${@[2,-1]}"
