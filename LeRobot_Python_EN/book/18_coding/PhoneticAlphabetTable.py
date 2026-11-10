from LibRobot import *

# Draw the table of the international phonetic
# alphabet

# Grid size (7 originally, enlarged for the current
# font)
g = 9
# Height of a box (and width of a small box)
h = 3
# Width of a large box
w = 11

# Squares a little higher than wide so that the text
# does not touch the boxes
def grid():
    gsX(g); gsY(g + 2)

def newLine():
    grid(); gl(); pu(); ht(); fdn(h); qtl(); fd()
    qtl(); pd()

def letter(l):
    grid()
    fdn(h); qtr(); fdn(h); qtr(); fdn(h); qtr(); fdn(h)
    pu(); ht(); fd(); qtl(); fd()
    label(l)
    ht(); fd(); qtl(); fdn(h - 1); qtl(); pd()

def codeWord(t):
    grid()
    fdn(h); qtr(); fdn(w); qtr(); fdn(h); qtr(); fdn(w)
    pu(); ht(); fd(); qtl(); fd()
    label(t)
    ht(); fd(); qtl(); fdn(w - 1); ht(); pd()
    gs(h); fd(); qtr(); grid(); fdn(h)
    qtr()
    gs(h); fd(); qtr(); grid(); fdn(h)
    ht()

textFont(courier); textSize(12); textStyle(bold)
gt(); newLine()
letter("A"); codeWord("Alpha")
letter("B"); codeWord("Bravo")
letter("C"); codeWord("Charlie")
letter("D"); codeWord("Delta")
letter("E"); codeWord("Echo")
newLine()
letter("F"); codeWord("Foxtrot")
letter("G"); codeWord("Golf")
letter("H"); codeWord("Hotel")
letter("I"); codeWord("India")
letter("J"); codeWord("Juliet")
newLine()
letter("K"); codeWord("Kilo")
letter("L"); codeWord("Lima")
letter("M"); codeWord("Mike")
letter("N"); codeWord("November")
letter("O"); codeWord("Oscar")
newLine()
letter("P"); codeWord("Papa")
letter("Q"); codeWord("Quebec")
letter("R"); codeWord("Romeo")
letter("S"); codeWord("Sierra")
letter("T"); codeWord("Tango")
newLine()
letter("U"); codeWord("Uniform")
letter("V"); codeWord("Victor")
letter("W"); codeWord("Whiskey")
letter("X"); codeWord("Xray")
letter("Y"); codeWord("Yankee")
newLine()
letter("Z"); codeWord("Zulu")
st()
