open LibRobot

(* Dessiner une frise de besicles *)

let besicles () =
  av (); av (); pqtd (); av (); pqtd (); av (); pqtd ();
  av (); av ();
  pqtd (); av (); av (); av (); pqtd ();
  av (); av (); pqtd (); av (); pqtd (); av (); pqtd ();
  av (); av ()

let frise () =
  pqtd ();
  for l = 1 to 8 do besicles () done

let () =
  ag (); frise (); st ()
