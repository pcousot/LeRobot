open LibRobot

(* Pavage de carrés disjoints en couleur *)

let tailleGrille = 19.
let tailleCrayon = 15
let longueurLigne = 23

(* Dessiner une colonne de gros points de la couleur
   du crayon, puis passer à la colonne suivante *)
let colonne () =
  ag ();
  for i = 1 to longueurLigne do av (); dp () done;
  pqtg (); av (); pqtd ()

let () =
  lg tailleGrille; ec tailleCrayon; eb (); pqtd (); lc ();
  cc jaune; colonne (); cc bleu; colonne ();
  cc violet; colonne (); cc vert; colonne ();
  cc rouge; colonne (); cc indigo; colonne ();
  cc noir; colonne ();
  cc indigo; colonne (); cc rouge; colonne ();
  cc vert; colonne (); cc violet; colonne ();
  cc bleu; colonne (); cc jaune; colonne ();
  st ()
