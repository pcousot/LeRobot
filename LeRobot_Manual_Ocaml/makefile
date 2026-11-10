# Manuels de LeRobot (OCaml) : make compile les deux PDF
all: LeRobot_Manual.pdf LeRobot_Install.pdf

%.pdf: %.tex
	latexmk -pdf -interaction=nonstopmode -quiet $< && latexmk -c $<

clean:
	latexmk -c LeRobot_Manual.tex LeRobot_Install.tex
