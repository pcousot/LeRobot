open LibRobot

(* Motif géométrique d'après Horemis *)

let () =
  lg 65.;
  for i = 1 to 12 do
    ce (); lc (); av (); pqtd (); bc ();
    for j = 1 to 4 do
      av (); pqtd (); av ()
    done;
    vd (); vd (); vd (); vd ();
    for j = 1 to 4 do
      av (); phtg (); peindre (); p3htd (); av ()
    done;
    lgRT (valLgX (), 45.)
  done;
  st ()
