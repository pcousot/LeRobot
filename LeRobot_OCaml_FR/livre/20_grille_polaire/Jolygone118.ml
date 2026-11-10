open LibRobot

(* Dessiner un jolygone à 118 degrés *)

let longueurInitiale = 300.
let angle = 118.
let nbrSegments = 80

let () =
  eb (); ag ();
  lg longueurInitiale; pqtd (); av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
