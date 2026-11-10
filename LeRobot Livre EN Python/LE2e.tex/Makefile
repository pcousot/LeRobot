# Makefile -- compilation du livre "First Programming Lessons in
# Python" (LE2e.tex) avec pdflatex.
#
#   make            compile LE2e.pdf (seulement si un fichier a change)
#   make complet    recompile tout depuis le debut
#   make propre     efface les fichiers intermediaires (garde LE2e.pdf)
#   make voir       ouvre LE2e.pdf
#   make listings   refait les listings python/*.tex (programmes de
#                   ../../LeRobot_Python_EN/livre, avec py2tex.py)
#
# Etapes : pdflatex (1re passe, ecrit LE2e.mx1 et LE2e.idx), musixflx
# (coupure des lignes des partitions), makeindex (index), puis deux passes
# de pdflatex pour la table des matieres, les renvois et l'index.
# Les figures ps-files/*.pdf sont deja converties (avec 2 pt de marge et les
# points des dessins rendus visibles) : elles ne sont pas refaites ici.
# Edition anglaise : pas de pages scannees de l'edition de 1991 ;
# les commentaires des listings sont traduits par py2tex.py avec
# traductions-commentaires.tsv (make listings).

TEXBIN   := /Library/TeX/texbin
PDFLATEX := $(TEXBIN)/pdflatex -interaction=nonstopmode -file-line-error
MUSIXFLX := $(TEXBIN)/musixflx
MAKEINDEX:= $(TEXBIN)/makeindex
GS       := /opt/homebrew/bin/gs

LIVRE    := LE2e
SOURCES  := $(wildcard *.tex) $(wildcard python/*.tex) $(wildcard ps-files/*.pdf)
INTERMEDIAIRES := $(LIVRE).aux $(LIVRE).log $(LIVRE).toc $(LIVRE).out \
                  $(LIVRE).idx $(LIVRE).ind $(LIVRE).ilg $(LIVRE).mx1 \
                  $(LIVRE).mx2 $(LIVRE).fls $(LIVRE).synctex.gz

.PHONY: all complet propre voir

all: $(LIVRE).pdf

$(LIVRE).pdf: $(SOURCES)
	@# LE2e.tex lit l'index par \input : il doit exister des la 1re passe
	@[ -f $(LIVRE).ind ] || touch $(LIVRE).ind
	$(PDFLATEX) $(LIVRE) > /dev/null || { $(MAKE) --no-print-directory erreurs; exit 1; }
	$(MUSIXFLX) $(LIVRE) > /dev/null
	$(MAKEINDEX) -q $(LIVRE)
	$(PDFLATEX) $(LIVRE) > /dev/null
	$(PDFLATEX) $(LIVRE) > /dev/null || { $(MAKE) --no-print-directory erreurs; exit 1; }
	@grep -a "Output written" $(LIVRE).log
	@n=$$(grep -a -c -E "^\./.*:[0-9]+:" $(LIVRE).log); \
	  [ "$$n" = 0 ] || { echo "$$n erreurs, voir $(LIVRE).log"; exit 1; }

# listings des programmes (python/*.tex) refaits a partir de
# ../../LeRobot_Python_EN/livre avec py2tex.py
.PHONY: listings
listings:
	./listings.sh

# erreurs de la derniere compilation
.PHONY: erreurs
erreurs:
	@grep -a -A3 -E "^\./.*:[0-9]+:|^! " $(LIVRE).log | head -40

complet: propre
	rm -f $(LIVRE).pdf
	$(MAKE) --no-print-directory all

propre:
	rm -f $(INTERMEDIAIRES)

voir: $(LIVRE).pdf
	open $(LIVRE).pdf
