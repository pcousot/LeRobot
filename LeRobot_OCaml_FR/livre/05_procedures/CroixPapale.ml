open LibRobot

(* Dessiner une croix papale *)

(* Dessiner une branche de longueur 1 *)
let branche1 () =
  pqtd (); av (); pqtg (); av (); pqtg (); av (); pqtd ()

(* Dessiner une branche de longueur 2 *)
let branche2 () =
  pqtd (); av (); av (); pqtg (); av (); pqtg ();
  av (); av (); pqtd ()

(* Dessiner une demi-croix *)
let demiCroix () =
  av (); branche1 (); av (); branche2 (); av ();
  branche1 (); av (); pqtg (); av ()

let croix () =
  demiCroix (); pqtg (); demiCroix ()

let () =
  croix (); st ()
