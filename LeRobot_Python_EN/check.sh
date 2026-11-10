#!/bin/zsh
# check.sh -- shows the programs of the book (book/) one after the other, to
# check the drawings one by one.
#
#   ./check.sh [FOLDER] [FROM]
#
#   FOLDER  subfolder of book/ (default: all), e.g. 02_interaction or
#           20_polar_grid
#   FROM    resume at the first program whose path contains this text
#           (e.g. Digit4)
#
# When the drawing is finished, answer IN THE ROBOT'S WINDOW (instructions in
# the bottom bar):
#   Return      drawing correct, next program
#   r           run the same program again
#   q or Esc    stop (the command to resume is printed)
#   other key   type a remark (ended by Return), noted in check.txt, then
#               next program
#
# Programs that ask questions (readln, readInt) show them in the bottom bar
# of the robot's window (and in this terminal): answer in either, then Return.
#
# LEROBOT_MUET=1 turns the sound off (songs, beeps).

cd "${0:A:h}"
export PYTHONPATH=$PWD${PYTHONPATH:+:$PYTHONPATH}
dir=book${1:+/$1}
from=$2
notes=$PWD/check.txt

list=(${(f)"$(find $dir -name '*.py' | sort)"})
total=${#list}
[ $total -eq 0 ] && { echo "no program in $dir"; exit 1; }

echo "Answer in the robot's window: Return = correct, r = run again,"
echo "q = quit, other key = remark (noted in check.txt)."

started=${from:+no}
n=0
for f in $list; do
  n=$((n + 1))
  if [ "$started" = no ]; then
    [[ $f == *$from* ]] && started=yes || continue
  fi
  name=${f#book/}
  while true; do
    print -P "%B[$n/$total] $name%b"
    grep -qE 'readInt|readReal|readString|readCharacter|readln\(\)' $f \
      && echo "  (this program asks questions: answer in the robot's window or here)"
    (cd ${f:h} && LEROBOT_VERIFIER=$notes LEROBOT_PROGRAMME="[$n/$total] $name" \
       ${LEROBOT_PYTHON:-python3} ${f:t})
    code=$?
    case $code in
      0)  ;;
      10) echo "  remark noted in check.txt" ;;
      11) continue ;;
      12) echo "Stopped. To resume: ./check.sh '$1' '${f:t:r}'"
          exit 0 ;;
      *)  echo "  the program stopped (code $code)"
          print -r -- "$name: abnormal stop (code $code)" >> $notes ;;
    esac
    break
  done
done
echo "Finished ($total programs)."
[ -s $notes ] && echo "Remarks: $notes"
exit 0
