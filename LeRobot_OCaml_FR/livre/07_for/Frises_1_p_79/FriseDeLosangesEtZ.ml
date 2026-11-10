open LibRobot

(* Dessiner une frise de losanges et de Z *)

let () =
  ag ();
  for m = 1 to 14 do
    (* Losange *)
    av (); phtd (); av (); p3htd (); av (); phtd ();
    av (); p3htd (); av (); phtd (); av (); phtd ();
    (* Z droit *)
    av (); pqtd (); av (); av (); pqtg (); av (); pqtg ()
  done;
  st ()
