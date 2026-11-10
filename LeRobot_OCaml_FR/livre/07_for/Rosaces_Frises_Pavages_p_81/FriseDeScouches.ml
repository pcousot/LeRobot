open LibRobot

(* Frise de S couchés *)

let () =
  (* Rejoindre le point de départ de la frise de S
     couchés *)
  lc (); ag (); pqtd (); av (); av (); av (); pqtd ();
  bc ();
  for i = 1 to 5 do
    (* S couché de gauche *)
    for j = 1 to 2 do
      vd (); vd (); vd (); phtd (); vd ();
      lc (); p3htg (); av (); pqtg (); bc ()
    done;
    lc (); pqtg (); av (); av (); av (); av (); pqtg ();
    bc ();
    (* S miroir couché de droite *)
    for j = 1 to 2 do
      vg (); vg (); vg (); phtg (); vg ();
      lc (); p3htd (); av (); pqtd (); bc ()
    done;
    (* Rejoindre le point de départ du couple suivant
       de S couchés *)
    lc (); pqtd (); av (); av (); av (); av (); pqtd ();
    bc ()
  done;
  st ()
