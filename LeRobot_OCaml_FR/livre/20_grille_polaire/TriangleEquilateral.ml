open LibRobot

(* Dessiner un triangle équilatéral *)

let longueurCote = 50.
let angle = 60.

let () =
  lgRT (longueurCote, angle);
  phtd (); av (); pqtd (); av (); p3htd (); avf 2;
  st ()
