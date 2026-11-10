open LibRobot

(* Dessiner un jolygone à 144 degrés *)

let longueurInitiale = 200.
let angle = 144.
let nbrSegments = 60

let () =
  eb (); lc (); av (); bc ();
  lg longueurInitiale; av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
