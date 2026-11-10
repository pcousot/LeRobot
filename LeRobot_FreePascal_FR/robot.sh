#!/bin/zsh
# robot.sh -- compile un programme Pascal (Free Pascal) avec les unites du
# robot et le lance dans la fenetre du robot.
#
#   ./robot.sh chemin/du/Programme.p
#
# Le programme peut etre n'importe ou. L'executable est cree dans
# _build/bin (a cote du programme s'il est hors de ce dossier). Le dessin
# est fait par la bibliotheque LeRobot_Python_FR (fenetre tkinter) : il faut
# un Python avec Tk 8.6 (voir ../LeRobot_Python_FR/README.md).
[ $# -ge 1 ] && [ -f "$1" ] || { echo "usage : $0 Programme.p"; exit 1; }
ici=${0:A:h}
src=${1:A}
unites=$ici/_build/unites
mkdir -p $unites
# unites du robot (recompilees si elles ont change)
for u in Robot1 Robot2 Robot3; do
  if [ ! -f $unites/$u.ppu ] || [ $ici/unites/$u.pas -nt $unites/$u.ppu ]; then
    fpc -Mmacpas -FU$unites $ici/unites/$u.pas >/dev/null || exit 1
  fi
done
if [[ $src == $ici/livre/* ]]; then
  rel=${src#$ici/livre/}; exe=$ici/_build/bin/${rel%.p}; obj=$ici/_build/obj/${rel:h}
else
  exe=${src%.p}; obj=${src:h}
fi
mkdir -p ${exe:h} $obj
# programme d'origine (Turbo Pascal du Macintosh, sans {$mode macpas}) :
# le convertir d'abord (voir outils/convertir.py)
if ! head -c 300 $src | grep -qi '{\$mode macpas}'; then
  conv=$ici/_build/convertis/${src:t}
  mkdir -p ${conv:h}
  python3 $ici/outils/convertir.py $src $conv || exit 1
  [[ $src == $ici/livre/* ]] || { exe=$ici/_build/convertis/${${src:t}%.p}; obj=${exe:h}; }
  src=$conv
fi
# compilation (les messages ne s'affichent qu'en cas d'erreur)
log=$(fpc -Fu$unites -FU$obj -o$exe $src 2>&1) || { print -r -- "$log" | grep -v '^Free Pascal\|^Copyright\|^Target\|^Compiling\|returned an error exitcode\|macos_version\|multiply_defined'; exit 1; }
cd ${src:h}
exec ${LEROBOT_PYTHON:-python3} $ici/serveur.py $exe "${@[2,-1]}"
