open LibRobot

(* Dessiner une frise de M et de M inversés *)

let () =
  ag (); phtd ();
  for i = 1 to 10 do
    (* Dessiner un motif | |/\ *)
    p3htd (); av (); av (); p3htg (); av (); pqtd ();
    av ();
    (* Dessiner un motif |\/ | *)
    p3htg (); av (); av (); p3htd (); av (); pqtg ();
    av ()
  done;
  (* Terminer la dernière branche | | *)
  p3htd (); av (); av (); st ()
