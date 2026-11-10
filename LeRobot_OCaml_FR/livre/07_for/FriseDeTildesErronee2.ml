open LibRobot

(* Dessiner une frise de tildes (deuxième erreur) *)

(* Dessiner un motif en forme de tilde ~ *)
let tilde () =
  phtd (); av (); phtd (); av ();
  pqtd (); av (); av (); pqtg ();
  av (); phtg (); av ()

let () =
  for i = 1 to 13 do
    tilde ();
    (* Reculer au début du tilde suivant *)
    lc (); p3htg (); av (); bc ()
  done;
  st ()
