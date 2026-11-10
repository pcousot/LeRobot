open LibRobot

(* Dessiner une rosace de dix pentagones *)

let longueurCote = 40.

let () =
  pqtd (); lg longueurCote;
  for i = 1 to 10 do
    rt 36.;
    for j = 1 to 5 do
      av (); rt 72.
    done
  done;
  st ()
