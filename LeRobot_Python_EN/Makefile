# Makefile -- LeRobot (Python, English names)
#
#   make draw            interactive drawing (Draw.py)
#   make my_drawing      replays the drawing saved by Draw (my_drawing.py)
#   make run PROG=x      runs x.py (e.g. make run PROG=book/03_programming/Square)
#   make check           shows the programs of the book one after the other
#                        DIR=02_interaction : one chapter only
#                        FROM=Digit4        : resume at this program
#   make capture         runs all the programs of the book without a window
#                        and saves the drawings in captures/

SHELL := /bin/zsh
PROG  ?= my_drawing
DIR   ?=
FROM  ?=

.PHONY: draw my_drawing run check capture

draw:
	./robot.sh Draw.py

my_drawing:
	./robot.sh my_drawing.py

run:
	./robot.sh $(PROG).py

check:
	./check.sh "$(DIR)" "$(FROM)"

capture:
	python3 tools/capture_all.py captures
