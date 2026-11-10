#!/bin/zsh
# launch.sh ROBOT_SH PROGRAM.py: runs the program with robot.sh. If the
# program ends normally (Esc, code 0), closes the Terminal window;
# otherwise (error) leaves it open so that the message can be read.
"$1" "$2"; code=$?
[ $code -eq 0 ] || exit $code
t=$(tty)
nohup osascript -e 'on run {t}' -e 'delay 0.3' -e 'tell application "Terminal"' \
  -e 'repeat with w in windows' -e 'if tty of tab 1 of w is t then close w' \
  -e 'end repeat' -e 'end tell' -e 'end run' "$t" >/dev/null 2>&1 &!
exit 0
