open LibRobot

(* Polygones inscrits au milieu des côtés *)

let n = 7
let a = 2. *. pi /. float_of_int n

let carre x = x *. x

let rec polygone x =
  if x >= 1. then begin
    tl (2. *. x);
    for i = 1 to n - 1 do
      rt (360. /. float_of_int n); av ()
    done;
    rt (360. /. float_of_int n); tl x;
    rt (180. /. pi *. atan (sin a /. (1. +. cos a)));
    polygone (sqrt (carre (x *. (1. +. cos a))
                    +. carre (x *. sin a)) /. 2.)
  end

let () =
  eb (); pe (); polygone 40.; st ()
