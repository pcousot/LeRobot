open LibRobot

(* Dessiner une hélice (grille de 40 pixels) *)

let () =
  lg 40.; ec 2;
  for i = 1 to 4 do
    vd (); vd (); vd (); vd (); vd ();
    pqtd (); av (); vg (); pqtg (); av (); vg ()
  done;
  st ()
