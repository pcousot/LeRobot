open LibRobot

(* Dessiner des cercles concentriques de diamètres 3,
   6, ... *)

let cercle () =
  lc (); av (); pqtg (); bc (); vg (); vg ();
  vg (); vg (); lc (); pqtg (); av (); pdt (); bc ()

let cerclesConcentriques () =
  for i = 1 to 12 do
    lg (float_of_int (3 * i)); cercle ()
  done

let () =
  cerclesConcentriques (); st ()
