#!/bin/zsh
# launch.sh PROGRAM.py: runs the program with robot.sh (for example from a
# double-click that opens a Terminal). If the program ends normally (Esc,
# code 0), closes the Terminal window; otherwise (error) leaves it open so
# that the message can be read.
${0:A:h}/robot.sh "$1"; code=$?
[ $code -eq 0 ] || exit $code
t=$(tty)
nohup osascript -e 'on run {t}' -e 'delay 0.3' -e 'tell application "Terminal"' \
  -e 'repeat with w in windows' -e 'if tty of tab 1 of w is t then close w' \
  -e 'end repeat' -e 'end tell' -e 'end run' "$t" >/dev/null 2>&1 &!
exit 0
