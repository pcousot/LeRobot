open LibRobot

(* Dessiner une frise de tildes (première erreur) *)

(* Dessiner un motif en forme de tilde ~ *)
let tilde () =
  phtd (); av (); phtd (); av ();
  pqtd (); av (); av (); pqtg ();
  av (); phtg (); av ()

let () =
  for i = 1 to 10 do
    tilde ()
  done;
  st ()
