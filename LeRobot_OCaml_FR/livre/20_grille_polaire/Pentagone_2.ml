open LibRobot

(* Dessiner un pentagone *)

let longueurCote = 50.

let () =
  lg longueurCote; pe ();
  for j = 1 to 5 do
    av ();
    rt 72.
  done;
  st ()
