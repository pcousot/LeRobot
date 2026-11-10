open LibRobot

(* Dessiner une frise de T *)

let dessinerT () =
  (* Côté gauche *)
  av (); pqtg (); av (); pqtg (); av (); pqtd (); av ();
  (* Dessus *)
  pqtd (); av (); av (); av (); pqtd ();
  (* Côté droit *)
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ()

let () =
  ag (); pqtd ();
  for t = 1 to 10 do
    dessinerT ();
    av () (* passer au T suivant *)
  done;
  st ()
