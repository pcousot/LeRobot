open LibRobot

(* Dessiner une spirale segmentée *)

(* Tourner à gauche puis avancer le robot tout droit
   de l fois la taille de la grille pour former un
   quart de tour. *)
let quartDeTour l =
  pqtg (); avf l

(* Tracer deux quarts de tour successifs pour former
   un demi-tour. *)
let demiTour l =
  quartDeTour l;
  quartDeTour l

(* Tracer une spirale de n demi-tours *)
let spirale n =
  for l = 1 to n do
    demiTour l
  done

let () =
  lg 6.; spirale 19; st ()
