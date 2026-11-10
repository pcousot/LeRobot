open LibRobot

(* Dessiner un jolygone à 60 degrés *)

let longueurInitiale = 150.
let angle = 60.
let nbrSegments = 80

let () =
  eb (); lc (); avf 3; bc ();
  lg longueurInitiale; av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
