open LibRobot

(* Dessiner une frise d'accolades *)

let accolade () =
  vd (); vg (); pqtd (); pqtd (); vg (); vd (); pqtd ();
  pqtd ()

let () =
  ag ();
  for i = 1 to 10 do accolade () done;
  st ()
