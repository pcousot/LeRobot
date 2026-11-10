open LibRobot

(* Dessiner des carrés superposés en agrandissant la
   grille *)

let carre () =
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  pqtd ()

let () =
  eb (); ag ();
  for i = 1 to 14 do
    lg (float_of_int (6 * i)); carre ()
  done;
  st ()
