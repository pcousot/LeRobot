open LibRobot

(* Dessiner le développement d'un tétraèdre régulier *)

let cote = 25.

let triangleEquilateral () =
  lgRT (cote, 60.); phtd (); av (); pqtd (); av ();
  p3htd (); avf 2; pdt ();
  avf 2; pqtg ()

let () =
  triangleEquilateral (); triangleEquilateral ();
  phtg (); av (); phtg (); avf 2; pqtd ();
  triangleEquilateral ();
  st ()
