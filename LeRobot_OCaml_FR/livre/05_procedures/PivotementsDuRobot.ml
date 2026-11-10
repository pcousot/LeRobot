open LibRobot

(* Les pivotements du robot définis par des procédures *)

(* Fait pivoter le robot sur place d'un quart de tour
   à droite *)
let pqtd () =
  phtd (); phtd ()

(* Fait pivoter le robot sur place d'un quart de tour
   à gauche *)
let pqtg () =
  phtg (); phtg ()

(* Fait pivoter le robot sur place de 3 huitièmes de
   tour à droite *)
let p3htd () =
  pqtd (); phtd ()

(* Fait pivoter le robot sur place de 3 huitièmes de
   tour à gauche *)
let p3htg () =
  pqtg (); phtg ()

(* Fait pivoter le robot sur place d'un demi-tour *)
let pdt () =
  pqtd (); pqtd ()

let () =
  av (); pqtd (); av (); pqtg (); av (); p3htd (); av ();
  p3htg (); av (); pdt (); av ();
  st ()
