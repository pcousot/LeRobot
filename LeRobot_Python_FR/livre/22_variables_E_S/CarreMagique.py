from LibRobot import *

# Construire un carré magique d'ordre impair

# Lire au clavier l'ordre n (impair) du carré
def lireOrdre():
    write("Ordre du carré magique (impair), n = ")
    n = lireEntier()
    if n > 0 and n % 2 == 1:
        return n
    else:
        return lireOrdre()

# Placer le robot au coin inférieur gauche du carré : un
# pas au-dessus et à droite du coin de la fenêtre
def origine():
    eb(); ag(); translater(1, 1)

# Écrire le texte s centré sur la position du robot
# (procédure technique qui utilise directement la
# bibliothèque graphique)
def ecrireCentre(s):
    Principal.wait()
    def faire():
        w, h = Graphics.text_size(s)
        x = Robot.pixel(valX())
        y = Robot.pixel(valY())
        Principal.draw(False)
        cx, cy = Graphics.current_point()
        Graphics.moveto(x - w // 2, y - h // 2 + 1)
        Graphics.draw_string(s)
        Graphics.moveto(cx, cy)
        Principal.draw(True)
    enreg(faire)

# Afficher l'élément c au centre de la case (i, j)
def afficher(i, j, c):
    origine(); translater(2 * i - 1, 2 * j - 1)
    ecrireCentre(str(c))

n = lireOrdre()
# Dessiner la matrice dans la fenêtre du robot
lg(20); cacherRobot()
for k in range(n + 1):
    origine(); translater(2 * k, 0); pn(); avf(2 * n)
    origine(); translater(0, 2 * k); pe(); avf(2 * n)
# Remplir le carré magique
# Ligne i et colonne j de la case à remplir
i = (n + 1) // 2
j = n
afficher(i, j, 1)
for c in range(2, n * n + 1):
    if c % n != 1:
        i = i % n + 1
        j = j % n + 1
    else:
        j -= 1
    afficher(i, j, c)
st()
