open LibRobot

(* Dessiner une étoile formée de quatre astroïdes
   à boucles *)

let arc () =
  phtg (); vd (); phtg (); vd (); phtg (); vd ()

let astroide () =
  arc (); p3htd (); arc (); p3htd (); arc (); p3htd ();
  arc ()

let etoile () =
  astroide (); phtd (); astroide (); phtd ();
  astroide (); phtd (); astroide ()

let () =
  etoile (); st ()
