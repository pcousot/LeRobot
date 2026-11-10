open LibRobot

(* Dessiner une hélice à quatre pales *)

let () =
  for i = 1 to 4 do
    lg 15.; vg (); vg ();
    vd (); vd ();
    lg 30.; vd (); vd (); pqtd ()
  done;
  st ()
