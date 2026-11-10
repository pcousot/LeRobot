open LibRobot

(* Dessiner une croix grecque *)

let cote () =
  av (); av (); av ()

let extremite () =
  pqtg (); av (); pqtg ()

(* Dessiner le côté gauche, l'extrémité puis le côté
   droit d'une branche, et orienter le robot en
   direction de la branche suivante. *)
let branche () =
  cote (); extremite (); cote (); pqtd ()

let croix () =
  branche (); branche (); branche (); branche ()

let () =
  croix (); st ()
