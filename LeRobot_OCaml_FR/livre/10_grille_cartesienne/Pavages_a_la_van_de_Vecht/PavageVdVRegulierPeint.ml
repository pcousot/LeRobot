open LibRobot

(* Pavage régulier peint inspiré d'un motif de
   N. J. van de Vecht *)

(* Motif de N. J. van de Vecht peint, le robot partant
   en haut à gauche et arrivant en bas à gauche
   orienté vers le nord. *)
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

let colonne () =
  eh ();
  for i = 1 to 4 do motifPeint () done;
  pqtd (); avf 4; pqtg ()

let () =
  ag (); lg 11.; eh (); avf (-24); avf 24;
  for i = 1 to 11 do colonne () done;
  avf 24; st ()
