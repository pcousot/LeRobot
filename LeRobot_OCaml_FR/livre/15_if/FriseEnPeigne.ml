open LibRobot

(* Dessiner une frise en peigne *)

let longueur = 15

let () =
  ag ();
  for i = 1 to 3 * longueur do
    avf 2; pqtd ();
    if tw () then pqtd ()
  done;
  st ()
