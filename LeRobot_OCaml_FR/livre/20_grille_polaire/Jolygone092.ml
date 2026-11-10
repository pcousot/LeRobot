open LibRobot

(* Dessiner un jolygone à 92 degrés *)

let longueurInitiale = 200.
let angle = 92.
let nbrSegments = 80

let () =
  eb (); lc (); av (); bc ();
  lg longueurInitiale; av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
