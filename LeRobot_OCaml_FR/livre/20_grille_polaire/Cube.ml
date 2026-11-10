open LibRobot

(* Dessiner le développement d'un cube *)

let cote = 18.

let carre () =
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  pqtd (); av ()

let () =
  eb (); lg cote;
  carre (); carre (); carre ();
  pqtg (); av (); pqtd (); carre ();
  pqtd (); av (); pqtg (); carre ();
  pqtd (); av (); pqtd (); av (); pqtg (); carre ();
  st ()
