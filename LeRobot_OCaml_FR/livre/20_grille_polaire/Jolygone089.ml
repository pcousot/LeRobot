open LibRobot

(* Dessiner un jolygone à 89 degrés *)

let longueurInitiale = 250.
let angle = 89.
let nbrSegments = 80

let () =
  eb (); ag ();
  lg longueurInitiale; pqtd (); av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
