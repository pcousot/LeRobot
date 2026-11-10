open LibRobot

(* Ligne de carrés (deplacer) *)

(* Carré de côté 1 *)
let carre () =
  av (); pqtd ();
  av (); pqtd ();
  av (); pqtd ();
  av (); pqtd ()

let () =
  for i = 1 to 10 do
    deplacer (i, i);
    carre ()
  done;
  st ()
