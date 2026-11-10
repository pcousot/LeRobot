#!/bin/zsh
# robot.sh -- compile un programme .ml avec la bibliotheque LeRobot
# (sans dune) et le lance dans la fenetre du robot.
#
#   ./robot.sh chemin/du/Programme.ml
#
# Le programme peut etre n'importe ou (pas besoin de fichier dune).
# L'executable est cree a cote du .ml (meme nom, sans extension).
# La bibliotheque doit avoir ete compilee une fois (make).

[ $# -eq 1 ] && [ -f "$1" ] || { echo "usage : $0 Programme.ml"; exit 1; }
lib=${0:A:h}/_build/default
src=${1:A}
exe=${src%.ml}
[ -f $lib/lerobot.cmxa ] || { echo "bibliotheque absente : lancer make dans ${0:A:h}"; exit 1; }

eval $(opam env)
export DISPLAY=:0
# XQuartz doit repondre (le lancer s'il le faut)
if ! /opt/X11/bin/xdpyinfo >/dev/null 2>&1; then
  echo "Demarrage de XQuartz..."; open -a XQuartz
  for i in {1..15}; do /opt/X11/bin/xdpyinfo >/dev/null 2>&1 && break; sleep 1; done
fi

cd ${src:h} || exit 1
ocamlfind ocamlopt -package graphics,unix -linkpkg \
  -I $lib -I $lib/.lerobot.objs/byte -I $lib/.lerobot.objs/native \
  $lib/lerobot.cmxa ${src:t} -o $exe || exit 1
# fichiers intermediaires de la compilation
rm -f ${exe}.cmi ${exe}.cmx ${exe}.o
$exe
