open LibRobot

(* Dessiner une spirale octogonale *)

let () =
  lg 1.;
  for i = 1 to 93 do
    lg (float_of_int i); av (); phtd ()
  done;
  st ()
