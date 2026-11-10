open LibRobot

(* Dessiner une croix double *)

(* Dessiner une branche de la croix *)
let branche () =
  pqtg (); av (); av (); pqtd (); av (); pqtd ();
  av (); av (); pqtg ()

(* Dessiner la moitié de la croix *)
let moitie () =
  av (); av (); branche (); av (); branche ();
  av (); av (); pqtd (); av (); pqtd ()

let croix () =
  moitie (); moitie ()

let () =
  croix (); st ()
