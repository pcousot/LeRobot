# Makefile LeRobot (OCaml) -- enveloppe autour de dune
#
#   make              compile tout (bibliotheque, Dessiner, mon_dessin)
#   make Dessiner     lance le dessin interactif
#   make mon_dessin   lance le programme mon_dessin.ml
#   make run PROG=x   lance le programme x.ml (x doit figurer dans dune)
#                     ex. make run PROG=livre/03_programmation/Carre
#   make verifier     fait defiler les programmes du livre, un par un ;
#                     repondre dans la fenetre du robot : Entree = correct,
#                     r = relancer, q = quitter, autre touche = remarque
#                     (notee dans verification.txt)
#                     DIR=02_interaction : un seul chapitre
#                     DEPUIS=Chiffre4    : reprendre a ce programme
#   make xquartz      demarre XQuartz (et verifie /tmp/.X11-unix)
#   make manual       compile le manuel ../LeRobot_Manual/LeRobot_Manual.pdf
#   make clean        efface les fichiers compiles

SHELL   := /bin/zsh
DISPLAY := :0
export DISPLAY
DUNE    := eval $$(opam env) && dune
MANUAL  := ../LeRobot_Manual
PROG    ?= mon_dessin
DIR     ?=
DEPUIS  ?=

.PHONY: all build Dessiner mon_dessin run xquartz manual clean verifier

all: build

build:
	$(DUNE) build

Dessiner: build xquartz
	$(DUNE) exec ./Dessiner.exe

mon_dessin: build xquartz
	$(DUNE) exec ./mon_dessin.exe

run: build xquartz
	$(DUNE) exec ./$(PROG).exe

# XQuartz refuse de demarrer si /tmp/.X11-unix manque ou n'appartient
# pas a root (frequent apres un redemarrage du Mac).
xquartz:
	@if [ ! -d /tmp/.X11-unix ] || [ "$$(stat -f %Su /tmp/.X11-unix)" != root ]; then \
	  echo "/tmp/.X11-unix absent ou pas a root : mot de passe demande (sudo)"; \
	  sudo mkdir -p /tmp/.X11-unix && sudo chown root:wheel /tmp/.X11-unix && sudo chmod 1777 /tmp/.X11-unix; \
	fi
	@if ! /opt/X11/bin/xdpyinfo >/dev/null 2>&1; then \
	  echo "Demarrage de XQuartz..."; open -a XQuartz; \
	  for i in {1..15}; do /opt/X11/bin/xdpyinfo >/dev/null 2>&1 && break; sleep 1; done; \
	fi

verifier: build xquartz
	./verifier.sh "$(DIR)" "$(DEPUIS)"

manual:
	cd $(MANUAL) && latexmk -pdf -interaction=nonstopmode -quiet LeRobot_Manual.tex && latexmk -c

clean:
	$(DUNE) clean
	cd $(MANUAL) && latexmk -c
