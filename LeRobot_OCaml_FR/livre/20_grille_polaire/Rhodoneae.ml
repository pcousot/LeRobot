open LibRobot

(* Tracer une rhodonée à trois pétales *)

let a = 60.

let () =
  lc (); cacherRobot ();
  for theta = 0 to 180 do
    ce (); pe (); rt (float_of_int theta);
    tl (a *. cos (3. *. (float_of_int theta /. 180.
                         *. pi)));
    dp ()
  done;
  st ()
