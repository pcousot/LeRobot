open LibRobot

(* Dessiner un triangle isocèle *)

let longueurCote = 50.
let angle = 70.

let () =
  lgRT (longueurCote, angle);
  phtd (); av ();
  pqtd (); av ();
  p3htd (); avf 2;
  st ()
