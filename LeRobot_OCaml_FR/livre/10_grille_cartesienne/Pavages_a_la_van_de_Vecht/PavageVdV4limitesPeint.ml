open LibRobot

(* Pavage irrégulier peint dans le style de
   M. C. Escher, inspiré d'un motif de
   N. J. van de Vecht. *)

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
   8, 6, 4, 2, le robot partant en haut à gauche et
   arrivant en bas à droite (c'est-à-dire en bas à
   gauche de la colonne suivante) orienté vers le nord. *)
let colonne () =
  lgY 1.; eh ();
  for i = 1 to 4 do
    lgY (float_of_int (2 * i)); motif ()
  done;
  for i = 1 to 3 do
    lgY (float_of_int (8 - (2 * i))); motif ()
  done;
  pqtd (); avf 4; pqtg ()

(* Même motif, peint *)
let motifPeint () =
  pqtd (); avf 4; pqtd (); avf 3; pqtd (); av (); pqtd ();
  avf 3; pdt (); avf 3;
  phtd (); peindre (); phtg (); av (); pqtd (); av ();
  pqtg (); av (); pqtg (); av ();
  pqtd (); av ();
  pqtd (); avf 3; pqtd (); av (); pqtd (); av (); pqtg ();
  av (); pqtg (); av (); pqtd (); av ();
  pqtd (); avf 3; pdt (); avf 3; phtd (); peindre ();
  phtd (); avf 3; lc (); pdt ();
  avf 6; pdt (); bc ()

let colonnePeinte () =
  lgY 1.; eh ();
  for i = 1 to 4 do
    lgY (float_of_int (2 * i)); motifPeint ()
  done;
  for i = 1 to 3 do
    lgY (float_of_int (8 - (2 * i))); motifPeint ()
  done;
  pqtd (); avf 4; pqtg ()

let () =
  lgX 1.; ag ();
  (* Dessiner un pavage irrégulier constitué de
     colonnes de largeurs 0, 2, 4, 6, ..., 10, 12, 10,
     ..., 2, 0. *)
  lgX 0.; colonne ();
  for i = 1 to 6 do
    lgX (float_of_int (2 * i)); colonnePeinte ()
  done;
  for i = 1 to 5 do
    lgX (float_of_int (12 - (2 * i))); colonnePeinte ()
  done;
  lgX 0.; colonne (); st ()
