open LibRobot

(* Rotations successives de 15 degrés : les segments
   tracés par av () ont tous la même longueur *)

let longueurCote = 50.
let n = 24

let () =
  message "lg 50.; pe (); av ()";
  lg longueurCote; pe (); av (); marquerUnePause ();
  for i = 1 to n do
    message "ce (); rt 15.; av ()";
    ce (); rt (360. /. float_of_int n); av ();
    marquerUnePause ()
  done;
  st ()
