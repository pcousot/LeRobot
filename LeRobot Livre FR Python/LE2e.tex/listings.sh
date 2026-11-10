#!/bin/zsh
# listings.sh -- refait les listings python/*.tex du livre a partir des
# programmes de ../../LeRobot_Python_FR/livre (ou de leurs extraits .extrait,
# qui ont priorite) et de sources/ (extraits propres au livre).
# Les partitions python/*Chanson.tex ne sont pas refaites.
cd ${0:A:h}
setopt null_glob
livre=../../LeRobot_Python_FR/livre
for t in python/*.tex; do
  n=${t:t:r}
  [[ $n == *Chanson ]] && continue
  src=
  for c in sources/$n.extrait sources/$n.py $livre/**/$n.extrait $livre/**/$n.py; do
    [ -f $c ] && { src=$c; break; }
  done
  if [ -z "$src" ]; then echo "source introuvable : $n"; continue; fi
  python3 py2tex.py $src > $t
done
