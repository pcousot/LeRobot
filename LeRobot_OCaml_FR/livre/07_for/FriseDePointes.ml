open LibRobot

(* Dessiner une frise de pointes *)

let () =
  ag (); pqtd ();
  for j = 1 to 32 do
    lc (); av (); bc (); pdt (); vd (); pdt ();
    av (); av (); pdt (); vd ()
  done;
  st ()
