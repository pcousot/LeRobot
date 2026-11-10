open LibRobot

(* Dessiner un jolygone à 76 degrés *)

let longueurInitiale = 150.
let angle = 76.
let nbrSegments = 80

let () =
  eb (); lc (); av (); av (); bc ();
  lg longueurInitiale; av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
