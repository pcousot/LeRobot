open LibRobot

(* Motif du pavage de quadrilatères inscrit dans un
   carré (6 x 6) *)

(* Dessiner un motif dans un carré (6 x 6), le robot
   partant et arrivant au centre du motif, orienté
   vers le nord. *)
let motif () =
  for i = 1 to 4 do
    lc (); pqtg (); av (); bc ();
    p3htd (); av (); av (); pqtg (); av (); pdt (); av ();
    phtg (); av (); av (); pdt (); av (); pqtd (); av ();
    pqtd (); av ();
    lc (); p3htd (); av (); av (); av (); bc ();
    phtd ()
  done

let () =
  motif (); st ()
