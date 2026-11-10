"""Dessiner -- le dessin interactif au clavier et a la souris.

    python3 Dessiner.py

Touches (rappelees dans la barre du bas) :
  - pqtg   + pqtd   g phtg   d phtd   a av   ( vg   ) vd
  b bc   l lc   c dc   . dg   p dp   * couleur suivante   w peindre
  retour arriere : annuler la derniere commande
  Entree : fin, puis y pour sauver le dessin dans mon_dessin.py
Un clic (ou un deplacement bouton enfonce) amene le robot, sans tracer, au
point de la grille le plus proche de la souris.
"""
from Interaction import interaction

# (coordonnees, pivotements, dessin, finsouris, sauver)
# finsouris = False : un clic souris ne termine pas le dessin (il le
# terminait dans la version de 1998) ; seule la touche Entree termine.
interaction(False, True, True, False, True)
