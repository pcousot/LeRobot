open LibRobot

(* Dessiner une frise de Z *)

let () =
  ag ();
  for m = 1 to 5 do
    (* Z penché à gauche *)
    phtd (); av (); p3htd (); av (); av (); p3htg ();
    av ();
    (* Motif suivant *)
    lc (); phtg (); av (); bc ();
    (* Z droit *)
    pqtd (); av (); pqtd (); av (); av (); pqtg (); av ();
    (* Motif suivant *)
    lc (); pqtg (); av (); bc ();
    (* Z inversé penché à droite *)
    p3htd (); av (); p3htg (); av (); av (); p3htd ();
    av ();
    (* Motif suivant *)
    lc (); phtd (); av (); pqtg (); bc ();
    (* Z droit inversé *)
    av (); pqtg (); av (); av (); pqtd (); av ();
    (* Motif suivant *)
    lc (); pqtd (); av (); pdt (); bc ()
  done;
  st ()
