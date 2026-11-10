open LibRobot

(* Dessiner une étoile à 6 branches *)

let tailleQuadrillage = 20.

let etoile () =
  phtd ();
  for i = 1 to 6 do
    av (); rt 60.; av (); rt 240.
  done

let () =
  lg tailleQuadrillage; etoile (); st ()
