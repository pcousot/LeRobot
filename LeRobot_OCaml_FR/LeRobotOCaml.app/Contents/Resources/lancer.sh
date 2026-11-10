#!/bin/zsh
# lancer.sh ROBOT_SH PROGRAMME.ml : compile et execute le programme avec
# robot.sh, puis efface l'executable cree a cote du .ml. Si le programme
# se termine normalement (Echap, code 0), ferme la fenetre du Terminal ;
# sinon (erreur de compilation ou d'execution) la laisse ouverte.
"$1" "$2"; code=$?
exe=${2:A}; exe=${exe%.ml}
[ -f "$exe" ] && [ -x "$exe" ] && rm -f "$exe"
[ $code -eq 0 ] || exit $code
t=$(tty)
nohup osascript -e 'on run {t}' -e 'delay 0.3' -e 'tell application "Terminal"' \
  -e 'repeat with w in windows' -e 'if tty of tab 1 of w is t then close w' \
  -e 'end repeat' -e 'end tell' -e 'end run' "$t" >/dev/null 2>&1 &!
exit 0
