open LibRobot

(* Pavage irrégulier dans le style de M. C. Escher,
   inspiré d'un motif de N. J. van de Vecht. *)

(* Motif de N. J. van de Vecht, le robot partant en
   haut à gauche et arrivant en bas à gauche orienté
   vers le nord. *)
let motif () =
  pqtd (); avf 4; pqtd (); avf 3; pqtd (); av (); pqtd ();
  avf 3; pdt (); avf 3;
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtd (); av (); pqtd (); avf 3;
  pqtd (); av (); pqtd (); av (); pqtg (); av (); pqtg ();
  av (); pqtd (); av (); pqtd (); avf 3;
  pdt (); avf 3; pqtd (); avf 3; lc (); pdt (); avf 6;
  pdt (); bc ()

(* Dessiner une colonne de motifs de hauteurs 2, 4, 6,
   8, 10, 8, 6, 4, 2, le robot partant en haut à gauche et
   arrivant en bas à droite (c'est-à-dire en bas à
   gauche de la colonne suivante) orienté vers le nord. *)
let colonne () =
  lgY 1.; eh ();
  for i = 1 to 5 do
    lgY (float_of_int (2 * i)); motif ()
  done;
  for i = 1 to 4 do
    lgY (float_of_int (10 - (2 * i))); motif ()
  done;
  pqtd (); avf 4; pqtg ()

(* Dessiner un pavage irrégulier constitué de colonnes
   de largeurs 0, 2, 4, 6, ..., 14, 16, 14, ..., 2, 0. *)
let pavage () =
  lgX 1.; ag (); lgX 0.;
  for i = 1 to 8 do
    colonne (); lgX (float_of_int (2 * i))
  done;
  for i = 1 to 8 do
    colonne (); lgX (float_of_int (16 - (2 * i)))
  done;
  colonne ()

let () =
  pavage (); st ()
