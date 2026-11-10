open LibRobot

(* Dessiner une frise crantée *)

(* Dessiner le motif 'n_' *)
let cran () =
  av (); pqtd (); av (); pqtd (); av (); pqtg (); av ();
  pqtg ()

let () =
  ag ();
  for i = 1 to 20 do
    cran ()
  done;
  st ()
