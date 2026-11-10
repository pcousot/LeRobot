from LibRobot import *

# Dessiner une rosace de rectangles
longueurGR = 108  # Longueur grand rectangle
largeurGR = 61  # Largeur grand rectangle, longueur petit rectangle
largeurPR = 16  # Largeur petit rectangle
n = 6  # 2 * n est le nombre de branches de l'étoile centrale

def rectangles():
    lc(); tl(largeurGR // 2); rt(90); bc()
    tl(longueurGR / 2); rt(90)
    tl(largeurGR); rt(90)
    tl(longueurGR); rt(90)
    tl(largeurGR); rt(90)
    tl(longueurGR / 2)
    lc(); tl(largeurPR / 2); rt(90); bc()
    tl(largeurGR); rt(90)
    lc(); tl(largeurPR); rt(90); bc()
    tl(largeurGR); pdt()

for i in range(n):
    rectangles(); ce(); rt(180 / n)
st()
