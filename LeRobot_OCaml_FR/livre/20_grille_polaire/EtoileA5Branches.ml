open LibRobot

(* Dessiner une étoile à 5 branches *)

let tailleQuadrillage = 60.

let etoile () =
  phtg ();
  for i = 1 to 5 do
    av (); rt 144.
  done

let () =
  lg tailleQuadrillage; etoile (); st ()
