open LibRobot

(* Dessiner une frise cannelée *)

let cannelure () =
  vd (); vd (); vg (); vg ()

let () =
  ag ();
  for i = 1 to 10 do cannelure () done;
  st ()
