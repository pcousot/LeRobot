open LibRobot

(* Dessiner une croix tréflée *)

(* Dessiner une branche terminée par un trèfle *)
let branche () =
  av (); av (); av (); av ();
  pqtd (); vg (); vg (); vd (); pdt (); vd (); vg (); vg ();
  pqtd (); av (); av (); av (); av ()

let croix () =
  branche (); pqtd (); branche (); pqtd ();
  branche (); pqtd (); branche (); pqtd ()

let () =
  croix (); st ()
