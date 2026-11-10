open LibRobot

(* Tracer la courbe de Moritz *)

let a = 60.

let () =
  lc (); cacherRobot ();
  for theta = -1800 to 1800 do
    ce (); pe (); rt (float_of_int theta);
    tl (a *. cos (9. *. (float_of_int theta /. 180. *. pi)
                /. 10.));
    dp ()
  done;
  st ()
