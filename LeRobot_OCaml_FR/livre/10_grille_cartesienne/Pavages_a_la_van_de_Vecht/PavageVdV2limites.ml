open LibRobot

(* Pavage rectangulaire à deux limites, inspiré d'un
   motif de N. J. van de Vecht *)

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
  lgY 1.; eh (); lgY 11.;
  for i = 1 to 4 do motif () done;
  pqtd (); avf 4; pqtg ()

let () =
  lgX 1.; ag (); lgX 0.;
  for i = 1 to 7 do
    colonne (); lgX (float_of_int (2 * i))
  done;
  for i = 1 to 7 do
    colonne (); lgX (float_of_int (14 - (2 * i)))
  done;
  colonne (); st ()
