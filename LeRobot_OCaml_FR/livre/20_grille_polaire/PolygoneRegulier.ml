open LibRobot

(* Dessiner un polygone régulier *)

let tailleQuadrillage = 30.
let nombreDeCotes = 7

(* Dessiner un polygone régulier de n >= 1 côtés *)
let polygone n =
  for i = 1 to n do
    av (); rt (360. /. float_of_int n)
  done

let () =
  lg tailleQuadrillage; polygone nombreDeCotes; st ()
