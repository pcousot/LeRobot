from LibRobot import *

# Alhambra mosaic
gridSizeX = 6
gridSizeY = 6
patternsPerRow = 4
numberOfRows = 4
patternWidth = 6
patternHeight = 8
spaceBetweenPatterns = 2  # > 1

# Distances between two neighbouring patterns
stepX = patternWidth + spaceBetweenPatterns
stepY = patternHeight + spaceBetweenPatterns

def pattern():
    cl(); qtr(); fd(); qtl(); fd()
    gsY(2 * gridSizeY); qtr(); cl()
    gsY(gridSizeY); qtr(); cr()
    qtl(); fd(); qtr(); fd(); qtl()
    gsY(2 * gridSizeY); cr(); cr()
    gsY(gridSizeY); qtl()
    fd(); qtr(); fd(); qtl(); cr(); qtr()
    gsY(2 * gridSizeY); cl()
    qtr(); gsY(gridSizeY)
    fd(); qtl(); fd(); qtr(); cl(); ht()

def row():
    for i in range(patternsPerRow):
        pattern(); translate(stepX, 0)

def tiling():
    for j in range(1, numberOfRows + 1):
        moveTo(-((patternsPerRow + j % 2) * stepX // 2), -(stepY * (j - numberOfRows // 2) // 2))
        row()

def frame():
    translate(-(stepX // 2 * (1 // numberOfRows)) - patternWidth // 2 * ((numberOfRows + 1) % 2) + spaceBetweenPatterns // 2 * (numberOfRows % 2), -spaceBetweenPatterns)
    for i in range(2):
        fdn((numberOfRows + 1) // 2 * stepY + (patternHeight - spaceBetweenPatterns) // 2 * ((numberOfRows + 1) % 2) + ((numberOfRows + 1) % 2 + 1) * spaceBetweenPatterns)
        qtl()
        fdn(-(stepX // 2 * (1 // numberOfRows)) + patternsPerRow * stepX + stepX // 2 + spaceBetweenPatterns)
        qtl()

gsX(gridSizeX)
gsY(gridSizeY)
tiling(); frame(); tetr(); paint()
st()
