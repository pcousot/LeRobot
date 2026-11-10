open LibRobot

(* Dessiner une frise serpentine barrée *)

let motifHaut () =
  vd (); pqtd (); av (); pdt (); av (); pqtd (); vd ()

let motifBas () =
  vg (); pqtg (); av (); pdt (); av (); pqtg (); vg ()

let frise () =
  for i = 1 to 10 do motifHaut (); motifBas () done

let () =
  ag (); frise (); st ()
