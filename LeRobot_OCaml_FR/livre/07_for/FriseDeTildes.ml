open LibRobot

(* Dessiner une frise de tildes *)

(* Dessiner un motif en forme de tilde ~ *)
let tilde () =
  phtd (); av (); phtd (); av ();
  pqtd (); av (); av (); pqtg ();
  av (); phtg (); av ()

let () =
  ag ();
  for i = 1 to 10 do
    tilde ();
    (* Reculer au début du tilde suivant *)
    lc (); p3htg (); av (); bc ();
    (* Orienter le robot au nord *)
    pqtd ()
  done;
  st ()
