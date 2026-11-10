# Makefile -- compilation du livre "Premieres lecons de programmation en
# Python" (LE2e.tex) avec pdflatex.
#
#   make            compile LE2e.pdf (seulement si un fichier a change)
#   make complet    recompile tout depuis le debut
#   make propre     efface les fichiers intermediaires (garde LE2e.pdf)
#   make voir       ouvre LE2e.pdf
#   make listings   refait les listings python/*.tex (programmes de
#                   ../../LeRobot_Python_FR/livre, avec py2tex.py)
#
# Etapes : pdflatex (1re passe, ecrit LE2e.mx1 et LE2e.idx), musixflx
# (coupure des lignes des partitions), makeindex (index), puis deux passes
# de pdflatex pour la table des matieres, les renvois et l'index.
# Les figures ps-files/*.pdf sont deja converties (avec 2 pt de marge et les
# points des dessins rendus visibles) : elles ne sont pas refaites ici.
# couvertures.pdf peut etre annote avec Apercu ; pdfpages ignore les
# annotations, on les incruste donc dans les pages (couvertures-aplaties.pdf,
# refait par Ghostscript a chaque modification de couvertures.pdf).
# couvertures-python.pdf (utilise par le livre) y remplace "OCaml" par
# "Python" (couvertures-python.tex).

TEXBIN   := /Library/TeX/texbin
PDFLATEX := $(TEXBIN)/pdflatex -interaction=nonstopmode -file-line-error
MUSIXFLX := $(TEXBIN)/musixflx
MAKEINDEX:= $(TEXBIN)/makeindex
GS       := /opt/homebrew/bin/gs

LIVRE    := LE2e
SOURCES  := $(wildcard *.tex) $(wildcard python/*.tex) $(wildcard ps-files/*.pdf) couvertures-python.pdf
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

# annotations d'Apercu incrustees dans les pages, images sans recompression
couvertures-aplaties.pdf: couvertures.pdf
	$(GS) -q -o $@ -sDEVICE=pdfwrite -dShowAnnots=true -dPreserveAnnots=false \
	  -dAutoFilterColorImages=false -sColorImageFilter=FlateEncode \
	  -dDownsampleColorImages=false -dAutoFilterGrayImages=false \
	  -sGrayImageFilter=FlateEncode -dDownsampleGrayImages=false \
	  -dEmbedAllFonts=true $<

# listings des programmes (python/*.tex) refaits a partir de
# ../../LeRobot_Python_FR/livre avec py2tex.py
.PHONY: listings
listings:
	./listings.sh

# couvertures de l'edition Python : "OCaml" remplace par "Python" sur les
# pages scannees (voir couvertures-python.tex)
couvertures-python.pdf: couvertures-python.tex couvertures-aplaties.pdf
	$(TEXBIN)/pdflatex -interaction=nonstopmode couvertures-python > /dev/null
	$(TEXBIN)/pdflatex -interaction=nonstopmode couvertures-python > /dev/null
	rm -f couvertures-python.aux couvertures-python.log

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
