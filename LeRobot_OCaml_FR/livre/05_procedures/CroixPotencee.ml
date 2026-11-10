open LibRobot

(* Dessiner une croix potencée *)

(* Dessiner une branche de la croix, en forme de T *)
let t () =
  av (); av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av (); av (); av (); pqtd (); av (); pqtd (); av ();
  pqtg (); av (); av (); pqtg ()

let () =
  t (); t (); t (); t (); st ()
