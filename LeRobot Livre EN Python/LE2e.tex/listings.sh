#!/bin/zsh
# listings.sh -- remakes the listings python/*.tex of the book from the
# programs of ../../LeRobot_Python_EN/book (or their excerpts .extrait,
# which come first) and from sources/ (excerpts of the book itself): one
# listing for every \input python/X.tex of the book. Listings no longer
# used are removed. The scores python/*Chanson.tex are not remade.
cd ${0:A:h}
setopt null_glob
book=../../LeRobot_Python_EN/book
names=(${(u)${(f)"$(grep -ho 'input *{\?python/[A-Za-z0-9_]*' *.tex | sed 's|.*python/||')"}})
for n in $names; do
  [[ $n == *Chanson ]] && continue
  src=
  for c in sources/$n.extrait sources/$n.py $book/**/$n.extrait $book/**/$n.py; do
    [ -f $c ] && { src=$c; break; }
  done
  if [ -z "$src" ]; then echo "source not found: $n"; continue; fi
  python3 py2tex.py $src > python/$n.tex
done
for t in python/*.tex; do
  n=${t:t:r}
  [[ $n == *Chanson ]] && continue
  (( ${names[(Ie)$n]} )) || { echo "removed (no longer used): $t"; rm -f $t; }
done
