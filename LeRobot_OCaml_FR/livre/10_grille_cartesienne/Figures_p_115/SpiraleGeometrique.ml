open LibRobot

(* Dessiner une spirale d'arcs de cercles de rayons
   1, 4, 9, 16, ... *)

let () =
  pdt ();
  for i = 1 to 12 do
    lg (float_of_int (i * i)); vg ()
  done;
  st ()
