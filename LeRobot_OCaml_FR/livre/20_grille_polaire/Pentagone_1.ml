open LibRobot

(* Dessiner un pentagone avec lgRT *)

let longueurCote = 50.

let () =
  lg longueurCote; pqtd (); av ();
  lgRT (longueurCote, 72.); phtg (); av ();
  lgRT (longueurCote, 144.); pqtg (); av ();
  pqtg (); av ();
  lgRT (longueurCote, 72.); pqtg (); av ();
  st ()
