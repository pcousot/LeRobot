open LibRobot

(* Dessiner une croix de Malte *)

let longueurBranche = 50.

let () =
  lgRT (longueurBranche, 30.);
  phtd ();
  for i = 1 to 2 do
    av (); p3htd (); avf 2; p3htd (); avf 2; p3htg ();
    avf 2; p3htg (); av ();
    lgRT (longueurBranche, 60.); pqtg ()
  done;
  st ()
