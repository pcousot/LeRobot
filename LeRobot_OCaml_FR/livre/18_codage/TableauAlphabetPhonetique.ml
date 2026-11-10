open LibRobot

(* Dessiner le tableau de l'alphabet phonétique
   international *)

(* Taille de la grille (7 à l'origine, agrandie pour la
   police de caractères actuelle) *)
let g = 9
(* Hauteur d'une boîte (et largeur d'une petite boîte) *)
let h = 3
(* Largeur d'une grande boîte *)
let l = 11

(* Carreaux un peu plus hauts que larges pour que le
   texte ne touche pas les boîtes *)
let grille () =
  lgX (float_of_int g); lgY (float_of_int (g + 2))

let aLaLigne () =
  grille (); ag (); lc (); pdt (); avf h; pqtg (); av ();
  pqtg (); bc ()

let lettre l =
  grille ();
  avf h; pqtd (); avf h; pqtd (); avf h; pqtd (); avf h;
  lc (); pdt (); av (); pqtg (); av ();
  ecrire l;
  pdt (); av (); pqtg (); avf (h - 1); pqtg (); bc ()

let traduction t =
  grille ();
  avf h; pqtd (); avf l; pqtd (); avf h; pqtd (); avf l;
  lc (); pdt (); av (); pqtg (); av ();
  ecrire t;
  pdt (); av (); pqtg (); avf (l - 1); pdt (); bc ();
  lg (float_of_int h); av (); pqtd (); grille (); avf h;
  pqtd ();
  lg (float_of_int h); av (); pqtd (); grille (); avf h;
  pdt ()

let () =
  policeTexte courier; tailleTexte 12; styleTexte gras;
  eh (); aLaLigne ();
  lettre "A"; traduction "Alpha";
  lettre "B"; traduction "Bravo";
  lettre "C"; traduction "Charlie";
  lettre "D"; traduction "Delta";
  lettre "E"; traduction "Echo";
  aLaLigne ();
  lettre "F"; traduction "Foxtrot";
  lettre "G"; traduction "Golf";
  lettre "H"; traduction "Hotel";
  lettre "I"; traduction "India";
  lettre "J"; traduction "Juliet";
  aLaLigne ();
  lettre "K"; traduction "Kilo";
  lettre "L"; traduction "Lima";
  lettre "M"; traduction "Mike";
  lettre "N"; traduction "November";
  lettre "O"; traduction "Oscar";
  aLaLigne ();
  lettre "P"; traduction "Papa";
  lettre "Q"; traduction "Quebec";
  lettre "R"; traduction "Romeo";
  lettre "S"; traduction "Sierra";
  lettre "T"; traduction "Tango";
  aLaLigne ();
  lettre "U"; traduction "Uniform";
  lettre "V"; traduction "Victor";
  lettre "W"; traduction "Whiskey";
  lettre "X"; traduction "Xray";
  lettre "Y"; traduction "Yankee";
  aLaLigne ();
  lettre "Z"; traduction "Zulu";
  st ()
