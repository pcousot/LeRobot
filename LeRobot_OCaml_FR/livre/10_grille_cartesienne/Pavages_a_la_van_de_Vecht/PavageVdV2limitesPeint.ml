open LibRobot

(* Pavage rectangulaire peint à deux limites, inspiré
   d'un motif de N. J. van de Vecht *)

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

let colonne () =
  eh ();
  for i = 1 to 4 do motif () done;
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
  eh ();
  for i = 1 to 4 do motifPeint () done;
  pqtd (); avf 4; pqtg ()

let () =
  ag (); lgY 11.;
  lgX 0.; colonne ();
  for i = 1 to 7 do
    lgX (float_of_int (2 * i)); colonnePeinte ()
  done;
  for i = 1 to 6 do
    lgX (float_of_int (14 - (2 * i))); colonnePeinte ()
  done;
  lgX 0.; colonne (); st ()
