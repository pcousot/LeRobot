open LibRobot

(* Dessiner une frise de dollars couchés *)

let () =
  (* Rejoindre l'extrémité droite de la frise *)
  lc (); ad (); pqtg (); av (); av (); pqtd (); bc ();
  for i = 1 to 10 do
    (* Dessiner un dollar couché *)
    (* Arc de l'extrémité droite du $ *)
    p3htg (); vg (); phtg ();
    (* Corps en S de $ *)
    vg (); vg (); vg (); vd (); vd (); vd ();
    (* Arc de l'extrémité gauche du $ *)
    phtd (); vd (); p3htd ();
    (* Rejoindre le $ de gauche *)
    lc (); pqtg (); av (); av (); pqtd (); bc ()
  done;
  st ()
