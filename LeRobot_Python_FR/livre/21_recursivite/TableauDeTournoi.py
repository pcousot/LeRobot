from LibRobot import *

# Dessiner le tableau d'un tournoi de tennis
l = 5  # Longueur d'un trait horizontal

# Dessiner un tableau pour un tournoi de n joueurs
def tableau(n):
    # Pointe de l'accolade, pour le vainqueur
    avf(l)
    if n > 1:
        # Branche supérieure de l'accolade
        pqtg(); avf(n); pqtd()
        # Sous-tableau supérieur, contenant la
        # moitié des joueurs
        tableau(n // 2)
        # Revenir au centre de l'accolade
        lc(); pqtg(); avf(-n); pqtd(); bc()
        # Branche inférieure de l'accolade
        pqtd(); avf(n); pqtg()
        # Sous-tableau inférieur, contenant le
        # reste des joueurs
        tableau(n - n // 2)
        # Revenir au centre de l'accolade
        lc(); pqtd(); avf(-n); pqtg(); bc()
    # Revenir à l'extrémité de la pointe
    avf(-l)

lg(3); pe(); tableau(16); st()
