open LibRobot

(* Ligne de carrés (translater) *)

(* Carré de côté 1 *)
let carre () =
  av (); pqtd ();
  av (); pqtd ();
  av (); pqtd ();
  av (); pqtd ()

let () =
  for i = 1 to 10 do
    translater (1, 1);
    carre ()
  done;
  st ()
