open LibRobot

(* Dessiner un jolygone à 15 degrés *)

let longueurInitiale = 60.
let angle = 15.
let nbrSegments = 100

let () =
  eb (); ad (); lc (); avf 2; bc ();
  lg longueurInitiale; av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
