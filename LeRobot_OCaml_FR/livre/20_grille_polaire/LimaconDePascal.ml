open LibRobot

(* Tracer le limaçon de Pascal *)

let a = 40.
let b = 80.

let () =
  lc ();
  for theta = 0 to 360 do
    ce (); pe (); rt (float_of_int theta);
    tl (a +. b *. cos (float_of_int theta /. 180. *. pi));
    dp ()
  done;
  st ()
