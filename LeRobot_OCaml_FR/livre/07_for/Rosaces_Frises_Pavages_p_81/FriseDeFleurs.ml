open LibRobot

(* Dessiner une frise de fleurs *)

let () =
  ag (); lc (); pqtd (); av (); av (); bc ();
  for i = 1 to 8 do
    for j = 1 to 8 do
      vd (); av (); av (); vd (); phtd ()
    done;
    lc ();
    for j = 1 to 5 do av () done;
    bc ()
  done;
  st ()
