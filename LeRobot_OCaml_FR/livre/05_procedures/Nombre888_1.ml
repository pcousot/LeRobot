open LibRobot

(* Dessiner le nombre 888 dans le style
   des montres digitales. *)
let () =
  (* Dessiner le 8 des centaines *)
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av ();
  (* Prévoir un espace et réorienter le robot vers le nord *)
  lc (); pqtd (); pqtd (); av (); av (); pqtg (); bc ();
  (* Dessiner le 8 des dizaines *)
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av ();
  (* Prévoir un espace et réorienter le robot vers le nord *)
  lc (); pqtd (); pqtd (); av (); av (); pqtg (); bc ();
  (* Dessiner le 8 des unités *)
  av (); pqtd (); av (); pqtg (); av (); pqtg (); av ();
  pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av ();
  st ()
