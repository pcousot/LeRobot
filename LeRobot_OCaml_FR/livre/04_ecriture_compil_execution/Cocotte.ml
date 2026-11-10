open LibRobot

(* Dessiner une cocotte en papier tournée vers l'ouest *)
let () =
  (* Arrière *)
  phtd (); av (); av (); av (); av ();
  phtg (); av (); av (); av (); av ();
  (* Dessus *)
  pqtd (); av (); av (); av (); av (); pqtd (); phtd ();
  (* Avant *)
  av (); av (); pqtg (); av (); av ();
  phtd (); av (); av (); av (); av ();
  (* Dessous *)
  pqtd (); phtd (); av (); av (); pqtg (); av (); av ();
  phtd (); av (); av (); av (); av ();
  (* Arrêt du robot *)
  st ()
