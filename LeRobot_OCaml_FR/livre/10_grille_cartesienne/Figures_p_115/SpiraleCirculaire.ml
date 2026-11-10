open LibRobot

(* Dessiner une spirale circulaire *)

let () =
  for i = 1 to 46 do
    lg (float_of_int (3 * i)); vd ()
  done;
  st ()
