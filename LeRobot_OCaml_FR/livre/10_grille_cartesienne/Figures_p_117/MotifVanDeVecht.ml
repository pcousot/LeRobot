open LibRobot

(* Dessiner le motif de N. J. van de Vecht, puis le
   même motif peint *)

(* Motif de N. J. van de Vecht *)
let motif () =
  pqtd (); avf 4; pqtd (); avf 3; pqtd (); av (); pqtd ();
  avf 3; pdt (); avf 3;
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtd (); av (); pqtd (); avf 3;
  pqtd (); av (); pqtd (); av (); pqtg (); av (); pqtg ();
  av (); pqtd (); av (); pqtd (); avf 3;
  pdt (); avf 3; pqtd (); avf 3; lc (); pdt (); avf 6;
  pdt (); bc ()

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

let () =
  motif ();
  lc (); pqtd (); avf 8; pqtg (); avf 6; bc ();
  motifPeint (); st ()
