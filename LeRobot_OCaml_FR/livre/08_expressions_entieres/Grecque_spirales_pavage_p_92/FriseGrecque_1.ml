open LibRobot

(* Dessiner une frise grecque *)

let () =
  ag ();
  for i = 1 to 8 do
    av (); av (); av (); av (); pqtd ();
    av (); av (); av (); av (); pqtd ();
    av (); av (); av (); pqtd ();
    av (); av (); pqtd ();
    av (); pqtd ();
    av (); pqtg ();
    av (); pqtg ();
    av (); av (); pqtg ();
    av (); av (); av (); pqtg ();
    av (); av (); av (); av (); pqtg ()
  done;
  st ()
