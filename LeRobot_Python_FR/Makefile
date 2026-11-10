# Makefile LeRobot (Python)
#
#   make Dessiner        lance le dessin interactif
#   make mon_dessin      lance le dessin sauve par Dessiner (mon_dessin.py)
#   make run PROG=x      lance x.py (ex. make run PROG=livre/03_programmation/Carre)
#   make verifier        fait defiler les programmes du livre, un par un
#                        DIR=02_interaction : un seul chapitre
#                        DEPUIS=Chiffre4    : reprendre a ce programme
#   make traduire        retraduit les programmes OCaml du livre
#                        (../LeRobot_OCaml_FR/livre) ; les programmes de
#                        outils/manuels.txt ne sont pas ecrases
#   make capturer        execute tous les programmes du livre sans fenetre
#                        et enregistre les dessins dans captures/

SHELL  := /bin/zsh
PROG   ?= mon_dessin
DIR    ?=
DEPUIS ?=

.PHONY: Dessiner mon_dessin run verifier traduire capturer

Dessiner:
	./robot.sh Dessiner.py

mon_dessin:
	./robot.sh mon_dessin.py

run:
	./robot.sh $(PROG).py

verifier:
	./verifier.sh "$(DIR)" "$(DEPUIS)"

traduire:
	python3 outils/ocaml2py.py --dossier ../LeRobot_OCaml_FR/livre livre

capturer:
	python3 outils/tout_capturer.py captures
