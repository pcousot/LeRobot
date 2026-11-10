open LibRobot

(* Dessiner une frise de podiums *)

let () =
  ag (); pqtd ();
  for x = 1 to 10 do
    (* Le robot étant orienté à l'est, dessiner deux
       marches du podium en montant *)
    av (); pqtg (); av (); pqtd (); av (); pqtg (); av ();
    (* Dessiner le sommet du podium *)
    pqtd (); av (); pqtd ();
    (* Le robot étant orienté au sud, dessiner deux
       marches du podium en descendant *)
    av (); pqtg (); av (); pqtd (); av ();
    (* Orienter le robot à l'est *)
    pqtg ()
  done;
  st ()
