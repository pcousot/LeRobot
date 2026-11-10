open LibRobot

(* Dessiner un jolygone à 175 degrés *)

let longueurInitiale = 350.
let angle = 175.
let nbrSegments = 40

let () =
  ag ();
  lg longueurInitiale; pqtd (); av ();
  for i = 1 to nbrSegments - 1 do
    rt angle; tl (valLgTl () *. 0.95)
  done;
  st ()
