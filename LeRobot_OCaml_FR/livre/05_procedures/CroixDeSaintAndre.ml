open LibRobot

(* Dessiner une croix de Saint André, c'est-à-dire une
   croix grecque penchée d'un huitième de tour *)

let cote () =
  av (); av (); av ()

let extremite () =
  pqtg (); av (); pqtg ()

let branche () =
  cote (); extremite (); cote (); pqtd ()

let croixGrecque () =
  branche (); branche (); branche (); branche ()

let croixDeSaintAndre () =
  phtd (); croixGrecque ()

let () =
  croixDeSaintAndre (); st ()
