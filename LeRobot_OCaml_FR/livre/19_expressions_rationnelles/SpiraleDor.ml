open LibRobot

(* Dessiner une spirale d'or *)

let nombreDor = (1. +. sqrt 5.) /. 2.

let () =
  lg 100.;
  for i = 1 to 12 do
    vd ();
    lg (valLgX () /. nombreDor)
  done;
  st ()
