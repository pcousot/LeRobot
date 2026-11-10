open LibRobot

(* Dessiner une croix de Malte *)

let largeur = 20.   (* Largeur d'une branche  *)
let longueur = 30.  (* Longueur d'une branche *)

(* Dessiner une branche verticale avec le robot
   orienté au nord ou au sud *)
let brancheVerticale () =
  lgX largeur; lgY longueur;
  vg (); pdt (); av (); av (); pdt (); vg (); pqtg ()

(* Dessiner une branche horizontale avec le robot
   orienté à l'est ou à l'ouest *)
let brancheHorizontale () =
  lgX longueur; lgY largeur;
  vg (); pdt (); av (); av (); pdt (); vg (); pqtg ()

let croixDeMalte () =
  for i = 1 to 2 do
    brancheVerticale (); brancheHorizontale ()
  done

let () =
  croixDeMalte (); st ()
